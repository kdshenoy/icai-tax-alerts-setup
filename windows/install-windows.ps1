<#
  install-windows.ps1
  – Installs Git, Node.js, Firebase CLI, JDK & Android Studio on Windows via winget
#>

# 1) Ensure winget is available
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Error "winget not found. Please install App Installer from the Microsoft Store first."
  exit 1
}

# 2) Install packages
winget install --id Git.Git -e --silent
winget install --id OpenJS.NodeJS.LTS -e --silent
winget install --id Google.FirebaseCLI -e --silent
winget install --id Microsoft.OpenJDK.17 -e --silent
winget install --id Google.AndroidStudio -e --silent

Write-Host "✅ Windows prerequisites installed!"
