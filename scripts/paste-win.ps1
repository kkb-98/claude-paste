Add-Type -AssemblyName System.Windows.Forms

$img = [System.Windows.Forms.Clipboard]::GetImage()

if (-not $img) {
    Write-Error "No image found in clipboard"
    exit 1
}

$dir = Join-Path $PWD ".claude" "screenshots"
if (-not (Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

$filename = "paste-$(Get-Date -Format 'yyyyMMdd-HHmmss').png"
$filepath = Join-Path $dir $filename
$img.Save($filepath, [System.Drawing.Imaging.ImageFormat]::Png)

Write-Output (Resolve-Path $filepath).Path
