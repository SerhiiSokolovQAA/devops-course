#!/usr/bin/env bash
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <source> <destination>" >&2
    exit 1
fi
if [[ ! -f "$1" ]]; then
    echo "Error: source '$1' not found." >&2
    exit 2
fi
cp -- "$1" "$2" && echo "Copied '$1' -> '$2'"