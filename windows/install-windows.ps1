# install-windows.ps1
# Run as Administrator in PowerShell

Write-Host "🔍 Checking for Chocolatey..."
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
  Write-Host "❌ Chocolatey not found. Please install it first:" -ForegroundColor Red
  Write-Host "  https://chocolatey.org/install" -ForegroundColor Yellow
  exit 1
}

Set-ExecutionPolicy Bypass -Scope Process -Force

Write-Host "⬇️ Installing Git, Node.js LTS, OpenJDK, Android Studio, Firebase CLI..."
choco install git -y
choco install nodejs-lts -y
choco install openjdk11 -y
choco install androidstudio -y
choco install firebase-cli -y

Write-Host "✅ All Windows dependencies installed!"

