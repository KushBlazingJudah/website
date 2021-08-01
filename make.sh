#!/bin/sh

file=${1?Please specify a file.}

# State will be 0 when we are not in a code block.
# State is 1 for when we are.
state=0

# Store some data temporarily.
# This can be done pipes but isn't to reduce complexity.
input=.tmp
output=.tmpout

# HACK: Lowdown messes up our code, so we're going to replace it with a placeholder.
# We need to store output in files though for post-processing.
codetmp=".tmpsrc"
counter=0

# Syntax!
lang=""

# Extra data.
extra=""
codeCss=0

# Get ready!
touch "$input" "$output"
mkdir "$codetmp"
exec 3>.tmp

cleanup() {
	# Cleanup!
	rm "$input" "$output"
	rm -r "$codetmp"
}

trap cleanup EXIT

# Read stdin, do our thing with the code blocks
while IFS= read -r line; do
	case "$line" in
		\`\`\`*) # This either means the start of end of a code block.
			if [ "$state" -eq 0 ]; then
				# This is a new code block.
				state=1
				lang=${line##\`\`\`}
		 		if [ -z "$lang" ]; then
					lang="txt"
				fi

				# Start with a blank state.
				: > "$input"
			elif [ "$state" -eq 1 ]; then
				# End of a code block.
				state=0

				# This does the heavy lifting here; we store the highlighted code
				# temporarily in $codetmp/$counter, and we use -f so we don't get
				# anything extra in the output, because we can simply just replace
				# our special marker with the code.
				highlight -f --force="$lang" --style=base16/gruvbox-dark-hard "$input" > "$codetmp/$counter"

				if [ "$codeCss" -eq 0 ]; then
					extra="$extra<link rel=\"stylesheet\" href=\"/highlight.css\" type=\"text/css\" media=\"all\">"
					codeCss=1
				fi

				# Write something that most likely will never be outputted by itself.
				printf '@@!!%d\n' "$counter" >> "$output"

				counter=$((counter + 1))
			fi
			;;
		*)
			if [ "$state" -eq 0 ]; then
				# Normal state, we don't need to send this to Highlight.
				printf '%s\n' "$line" >> "$output"
			else
				# This is going to Highlight.
				printf '%s\n' "$line" >> $input
			fi
			;;
	esac
done < "$file"

# Alright, now that we have our code blocks seperated we can send $output to
# Lowdown. We're going to throw the output of that into $input.
lowdown "$output" > "$input"

# Output our header. Now's the time.

# Let's make some variables first.
title=$(lowdown -XTitle $output 2>/dev/null || echo "Untitled")
desc=$(lowdown -XDescription $output 2>/dev/null || echo "No description.")
now=$(date +%Y-%m-%d)
last_commit="unavailable"
last_commit_date="unavailable"
if git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
	last_commit=$(git log -n 1 --pretty=format:%H -- "$file" 2>/dev/null)
	last_commit_date=$(git log -n 1 --pretty=format:%as -- "$file" 2/dev/null)
fi

# This is by no means the best way to do this. However, it works for now.
sed -e "s|%%TITLE%%|${title}|g" \
    -e "s|%%NOW%%|${now}|g" \
    -e "s|%%EXTRA%%|${extra}|g" \
    -e "s|%%LASTCOMMIT%%|${last_commit}|g" \
    -e "s|%%LASTCOMMITDATE%%|${last_commit_date}|g" \
    -e "s|%%DESC%%|${desc}|g" \
    _header.html

# Let's now replace our placeholders.
while IFS= read -r line; do
	case "$line" in
		\<p\>@@!!*\</p\>) # Our placeholder!
			# Let's get our counter, output and cleanup.
			_counter=${line##<p>@@!!}
			counter=${_counter%%</p>}

			printf '%s' "<pre><code>"
			cat "$codetmp/$counter"
			printf '%s\n' "</code></pre>"
			;;
		*)
			# Nothing needs to be done.
			printf '%s\n' "$line"
			;;
	esac
done < "$input"

# Copy and paste from earlier; just for the footer this time
sed -e "s|%%TITLE%%|${title}|g" \
    -e "s|%%NOW%%|${now}|g" \
    -e "s|%%EXTRA%%|${extra}|g" \
    -e "s|%%LASTCOMMIT%%|${last_commit}|g" \
    -e "s|%%LASTCOMMITDATE%%|${last_commit_date}|g" \
    -e "s|%%DESC%%|${desc}|g" \
    _footer.html
