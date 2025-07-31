cd mac
cat > install-mac.sh << 'EOF'
#!/usr/bin/env bash
if ! command -v brew &>/dev/null; then
  echo "❌ Install Homebrew first: https://brew.sh/" && exit 1
fi
brew update
brew install git node openjdk@11
brew install --cask android-studio
brew tap firebase/tap && brew install firebase-cli
echo "✅ macOS dependencies installed!"
EOF
chmod +x install-mac.sh
cd ..
