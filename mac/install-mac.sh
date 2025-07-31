#!/usr/bin/env bash
# install-mac.sh
# Run: chmod +x install-mac.sh && ./install-mac.sh

# Check for Homebrew
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew not found. Please install from https://brew.sh/"
  exit 1
fi

echo "⬇️ Updating Homebrew..."
brew update

echo "⬇️ Installing Git, Node, OpenJDK, Android Studio, Firebase CLI..."
brew install git
brew install node
brew install openjdk@11
brew install --cask android-studio
brew tap firebase/tap
brew install firebase-cli

echo "✅ All macOS dependencies installed!"
