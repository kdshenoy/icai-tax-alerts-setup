# install-windows.ps1
Write-Host "🔍 Checking for Chocolatey..."
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
  Write-Host "❌ Please install Chocolatey first: https://chocolatey.org/install" -ForegroundColor Red
  exit 1
}
choco install git nodejs-lts openjdk11 androidstudio firebase-cli -y
Write-Host "✅ Windows dependencies installed!"
