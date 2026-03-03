#!/bin/bash
set -euo pipefail

DIR=".claude/screenshots"
mkdir -p "$DIR"

FILENAME="paste-$(date +%Y%m%d-%H%M%S).png"
FILEPATH="$DIR/$FILENAME"

if command -v pngpaste &>/dev/null; then
    pngpaste "$FILEPATH"
else
    osascript -e 'the clipboard as «class PNGf»' | \
        sed 's/«data PNGf//;s/»//' | xxd -r -p > "$FILEPATH"
fi

if [ ! -s "$FILEPATH" ]; then
    rm -f "$FILEPATH"
    echo "No image found in clipboard" >&2
    exit 1
fi

echo "$(cd "$(dirname "$FILEPATH")" && pwd)/$(basename "$FILEPATH")"
