#!/bin/sh -e

# Utility script for replacing placeholder values from stdin.

file="$1"

title=""
desc=""
commit="???"
date="???"

if [ -z "$file" ]; then
	printf 'No filename supplied. Git information will be unavailable.\n' >&2
else
	if git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
	       commit="$(git log -n 1 --pretty=format:%H -- "$file" 2>/dev/null)"
	       date="$(git log -n 1 --pretty=format:%as -- "$file" 2/dev/null)"
	else
		printf "WARN\t'%s' isn't tracked by Git.\n" "$file" >&2
	fi
fi

title="$(lowdown -X title "$file" 2>/dev/null || printf 'Untitled') - WSJ"

s() {
	sed	-e "s|%%title%%|$title|g" \
		-e "s|%%desc%%|$desc|g" \
		-e "s|%%commit%%|$commit|g" \
		-e "s|%%date%%|$date|g" \
		-e "s|%%file%%|/$file|g"
}

if [ "$file" = "index.md" ]; then
	title="WSJ"
	cat lib/header.html - lib/footer.html | s
else
	cat lib/header.html lib/header_body.html - lib/footer.html lib/footer_body.html | s
fi
