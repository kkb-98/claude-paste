---
description: Paste an image from clipboard
---

Grab the image currently in the user's system clipboard, save it to a file, and read it.

1. Detect the operating system from the runtime environment.
2. Run the matching script from the plugin's `scripts/` directory:
   - Windows: `powershell.exe -ExecutionPolicy Bypass -File <plugin_dir>/scripts/paste-win.ps1`
   - macOS: `bash <plugin_dir>/scripts/paste-mac.sh`
   - Linux: `bash <plugin_dir>/scripts/paste-linux.sh`
3. The script prints the absolute path of the saved image.
4. Use the Read tool to open that image file.
5. Describe what you see, or wait for the user to ask a question about it.

If the script exits with an error, relay the message to the user.
