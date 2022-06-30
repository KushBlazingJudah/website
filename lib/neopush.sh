#!/bin/sh -e

# Uploads or deletes files according to the output produced by ./lib/neodiff.sh.

token="$(cat ~/.config/neocities/config)"

if [ -z "$token" ]; then
	printf 'Put your site token in ~/.config/neocities/config and rerun this script' >&2
	exit 1
fi

if ! command -v curl >/dev/null; then
	printf 'Install curl.' >&2
	exit 1
fi

dir="$1"

req() {
	curl -s -H "Authorization: Bearer $token" "$@"
}

del() {
	req -F "filenames[]=$1" "https://neocities.org/api/delete"
}

add() {
	req -F "$1=@$dir/$1" "https://neocities.org/api/upload"
}

while IFS='	' read -r action file; do
	# lol
	"$action" "$file"
done
