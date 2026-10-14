#!/usr/bin/env bash
if [[ $# -ne 1 || ! -f "$1" ]]; then
    echo "Usage: $0 <existing_file>" >&2
    exit 1
fi
echo "Lines in '$1': $(wc -l < "$1")"