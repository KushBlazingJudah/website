#!/bin/sh -e

# Diffs your site compared to $1.
# May or may not work on other systems or places, kinda hard to test

token="$(cat ~/.config/neocities/config)"

if [ -z "$token" ]; then
	printf 'Put your site token in ~/.config/neocities/config and rerun this script' >&2
	exit 1
fi

if ! command -v curl >/dev/null; then
	printf 'Install curl.' >&2
	exit 1
fi

if ! command -v jq >/dev/null; then
	printf 'Install jq.' >&2
	exit 1
fi

req() {
	curl -s -H "Authorization: Bearer $token" "$@"
}

req "https://neocities.org/api/list" | jq -r ".files[] | [.path, .sha1_hash] | @tsv" | sort > .tmp

find "$1" -mindepth 1 | while read -r line; do
	hash=
	if [ -f "$line" ]; then
		hash="$(sha1sum "$line")"
	fi
	printf '%s	%s\n' "${line#"$1"/}" "${hash%% *}"
done | sort | diff .tmp - | tail -n+4 > .tmp2
rm .tmp

add=""
del=""
while IFS='	' read -r file _; do
	case "$file" in
		" "*)	;;
		+*)
			add="$add ${file#+}"
			;;
		-*)
			del="$del ${file#-}"
			;;
	esac
done < .tmp2
rm .tmp2

for i in $add; do
	if [ ! -d "$1/$i" ]; then
		printf 'add	%s\n' "$i";
	fi
done

for i in $del; do
	ok=
	for j in $add; do
		if [ "$i" = "$j" ]; then
			ok=1
			break
		fi
	done

	if [ -z "$ok" ]; then
		printf 'del	%s\n' "$i";
	fi
done
