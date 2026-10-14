#!/usr/bin/env bash
file="$1"
if [[ -z "$file" ]]; then
    echo "Error: no file given. Usage: $0 <file>" >&2; exit 1
elif [[ ! -e "$file" ]]; then
    echo "Error: file '$file' does not exist." >&2; exit 2
elif [[ ! -r "$file" ]]; then
    echo "Error: file '$file' is not readable." >&2; exit 3
fi
cat -- "$file"