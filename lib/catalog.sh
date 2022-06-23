#!/bin/sh -e

# Generates catalog.md.

cat <<EOF
# Articles [[RSS](/index.xml)]

EOF

{
while [ "$#" -gt 0 ]; do
	date="$(lowdown -X date "$1" 2>/dev/null || echo 'No date')"
	title="$(lowdown -X title "$1" 2>/dev/null || echo 'No title')"
	loc="${1%.*}.html"

	cat <<EOF
- [\[$date\] $title]($loc)
EOF
	shift 1
done
} | sort -r # HACK
