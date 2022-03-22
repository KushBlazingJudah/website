#!/bin/sh -e

# Awfully written script to build the website and place the results in _out.
# Passes shellcheck.

COPY="index.html style.css key.asc favicon.ico media"
PROCESS="software.md thoughts.md"
ARTICLES="articles"
OUT="_out"
URL="https://wsmj.neocities.org"

# Used as placeholder values
SELF_HASH="$(git log -n 1 --pretty=format:%H -- "$0")"
SELF_DATE="$(git log -n 1 --pretty=format:%as -- "$0")"

filter_placeholders() {
	sed	-e "s|%%title%%|$1|g" \
		-e "s|%%desc%%|$2|g" \
		-e "s|%%commit%%|$3|g" \
		-e "s|%%date%%|$4|g" \
		-e "s|%%file%%|/$5|g"
}

process() {
	# $1: file path
	# $2: file output

	title="$(lowdown -X title "$1" 2>/dev/null || printf 'Untitled')"
	desc="$(lowdown -X desc "$1" 2>/dev/null || printf 'No description.')"

	commit="$SELF_HASH"
	commit_date="$SELF_DATE"
	if git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
	       commit=$(git log -n 1 --pretty=format:%H -- "$file" 2>/dev/null)
	       commit_date=$(git log -n 1 --pretty=format:%as -- "$file" 2/dev/null)
	fi

	# This isn't a great solution but hey, it works
	lowdown -Thtml "$1" | cat _header.html - _footer.html | filter_placeholders "$title" "$desc" "$commit" "$commit_date" "$1"
}

genuuid() {
	guid=$(uuidgen)

	# This only works with GNU sed.
	# Replace the first blank line with a guid metadata key and a newline.
	sed -i "0,/^$/s//guid: $guid\n/" "$1"

	printf '%s' "$guid"
}

add_catalogue() {
	date="$(lowdown -X date "$1" 2>/dev/null || echo 'No date')"
	title="$(lowdown -X title "$1" 2>/dev/null || echo 'No title')"
	desc="$(lowdown -X desc "$1" 2>/dev/null || echo 'No description')"
	guid="$(lowdown -X guid "$1" 2>/dev/null || genuuid "$1")"
	loc="${1%.*}.html"

	printf '<li><a href="%s">[%s] %s</a></li>\n' "$loc" "$date" "$title" >> articles.html.tmp

	cat >> "$OUT/index.rss" <<EOF
	<item>
		<title>$title</title>
		<description>$desc</description>
		<link>$URL/$loc</link>
		<guid isPermaLink="false">$guid</guid>
		<pubDate>$(date -d "$date" -R)</pubDate>
	</item>
EOF
}

start_catalogue() {
	cat _header.html - >articles.html.tmp <<EOF
<h1>Articles</h1>

<ul>
EOF
	cat > "$OUT/index.rss" <<EOF
<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">
<channel>
	<title>WeedSmokingJew</title>
	<description>My RSS feed for articles I write.</description>
	<link>$URL</link>
	<lastBuildDate>$(date -R)</lastBuildDate>

EOF
}

finish_catalogue() {
	cat - _footer.html >>articles.html.tmp <<EOF
</ul>
EOF
	cat >> "$OUT/index.rss" <<EOF
</channel>
</rss>
EOF
	filter_placeholders "Article list" "A list of articles I have written." "$SELF_HASH" "$(date +%Y-%m-%d)" "articles.html" < articles.html.tmp > "$OUT/articles.html"
	rm articles.html.tmp
}

if [ ! -e "$OUT" ]; then
	echo "creating output folder"
	mkdir "$OUT"
	mkdir "$OUT/articles"
fi

echo "copying static files"
for file in $COPY; do
	cp -rvu "$file" "$OUT"
done

echo "processing markdown"
for file in $PROCESS; do
	name="$(basename "$file")"

	if [ ! -e "$name" ] || ! cmp -s "$file" "$OUT/$file"; then
		echo "explicit process: $name"

		process "$file" > "$OUT/${file%.*}.html"
		cp "$file" "$OUT"
	fi
done

echo "creating catalogue"
start_catalogue
find "$ARTICLES" -type f -name "*.md" | sort -nr | while read -r file; do
	name="$OUT/${file%.*}.html"

	if [ ! -e "$name" ] && ! cmp -s "$file" "$OUT/$file"; then
		echo "processing article: $(basename "$file")"
		process "$file" > "$name"
		cp "$file" "$OUT/$file"
	fi

	add_catalogue "$file"
done
finish_catalogue

du -hs "$OUT"
echo "done."
