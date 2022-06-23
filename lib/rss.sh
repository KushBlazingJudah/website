#!/bin/sh -e

# Generates an HTML RSS file to stdout from files passed to stdin.
# This kinda sucks, however it gets the job done.

URL="https://wsmj.neocities.org"

cat <<EOF
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
<channel>
	<title>WeedSmokingJew</title>
	<description>My RSS feed for articles I write.</description>
	<link>$URL</link>
	<lastBuildDate>$(date -R)</lastBuildDate>
	<atom:link href="$URL/index.rss" rel="self" type="application/rss+xml"/>
EOF

while [ "$#" -gt 0 ]; do
	date="$(lowdown -X date "$1" 2>/dev/null || echo 'No date')"
	title="$(lowdown -X title "$1" 2>/dev/null || echo 'No title')"
	desc="$(lowdown -X desc "$1" 2>/dev/null || echo 'No description')"
	guid="$(lowdown -X guid "$1" 2>/dev/null || genuuid "$1")"
	loc="${1%.*}.html"

	cat <<EOF
	<item>
		<title>$title</title>
		<link>$URL/$loc</link>
		<guid isPermaLink="false">$guid</guid>
		<pubDate>$(date -d "$date" -R)</pubDate>
		<description>
EOF
	lowdown -Thtml "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g'
	cat <<EOF
		</description>
	</item>
EOF
	shift 1
done

cat <<EOF
</channel>
</rss>
EOF
