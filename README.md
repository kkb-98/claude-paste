# claude-paste

Paste clipboard images into Claude Code with a single command.

No more saving screenshots to files and typing out paths manually.

## Install

```bash
claude plugin install --dir /path/to/claude-paste
```

Or clone and load directly:

```bash
git clone https://github.com/kkb-98/claude-paste.git
claude --plugin-dir ./claude-paste
```

## Usage

1. Take a screenshot (or copy any image to clipboard)
2. In Claude Code, run:

```
/claude-paste:paste
```

3. Claude reads the image and responds

Screenshots are saved to `.claude/screenshots/` in your project directory.

## Platform Support

| OS | Method | Requirement |
|---|---|---|
| Windows | PowerShell Clipboard API | None (built-in) |
| macOS | pngpaste / osascript | `brew install pngpaste` (optional) |
| Linux | xclip / xsel / wl-paste | Install one of them |

## Why?

Claude Code supports `Ctrl+V` image paste on macOS, but:

- It only works for direct screenshots, not images copied from browsers or apps
- Windows support is still missing ([#26679](https://github.com/anthropics/claude-code/issues/26679))
- Linux terminal support is inconsistent

This plugin fills that gap with a cross-platform solution.

## License

MIT
