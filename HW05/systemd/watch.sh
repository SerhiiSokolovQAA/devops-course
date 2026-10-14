#!/usr/bin/env bash
WATCH_DIR="$HOME/watch"
mkdir -p "$WATCH_DIR"

process_file() {
    local f="$1"
    [[ -f "$f" && "$f" != *.back ]] || return
    echo "=== New file: $f ==="
    cat -- "$f"
    mv -- "$f" "$f.back" && echo "Renamed -> $f.back"
}

for f in "$WATCH_DIR"/*; do process_file "$f"; done

inotifywait -m -q -e close_write -e moved_to --format '%w%f' "$WATCH_DIR" |
while read -r path; do
    process_file "$path"
done