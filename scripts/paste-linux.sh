#!/bin/bash
set -euo pipefail

DIR=".claude/screenshots"
mkdir -p "$DIR"

FILENAME="paste-$(date +%Y%m%d-%H%M%S).png"
FILEPATH="$DIR/$FILENAME"

if command -v xclip &>/dev/null; then
    xclip -selection clipboard -t image/png -o > "$FILEPATH" 2>/dev/null
elif command -v xsel &>/dev/null; then
    xsel --clipboard --output > "$FILEPATH" 2>/dev/null
elif command -v wl-paste &>/dev/null; then
    wl-paste --type image/png > "$FILEPATH" 2>/dev/null
else
    echo "Install xclip, xsel, or wl-clipboard to use this plugin" >&2
    exit 1
fi

if [ ! -s "$FILEPATH" ]; then
    rm -f "$FILEPATH"
    echo "No image found in clipboard" >&2
    exit 1
fi

echo "$(cd "$(dirname "$FILEPATH")" && pwd)/$(basename "$FILEPATH")"
