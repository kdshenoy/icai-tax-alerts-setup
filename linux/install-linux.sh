#!/usr/bin/env bash
# install-linux.sh
# Run with: chmod +x install-linux.sh && sudo ./install-linux.sh

set -e

echo "⬇️ Updating apt..."
sudo apt update

echo "⬇️ Installing Git, Node.js, OpenJDK..."
sudo apt install -y git nodejs npm openjdk-11-jdk

echo "⬇️ Installing Android Studio..."
sudo snap install android-studio --classic

echo "⬇️ Installing Firebase CLI..."
sudo npm install -g firebase-tools

echo "✅ All Linux dependencies installed!"
