#!/usr/bin/env bash
file="${1:-test.txt}"
if [[ -f "./$file" ]]; then
    echo "File '$file' exists in the current directory."
else
    echo "File '$file' does not exist in the current directory."
fi