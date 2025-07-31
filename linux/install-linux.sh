cat > linux/install-linux.sh << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

echo "🔄 Updating package lists…"
sudo apt update

echo "⬇️ Installing Git, curl, OpenJDK, Node.js, Firebase CLI, and Android Studio…"
# Git + curl
sudo apt install -y git curl lsb-release

# Node.js 18.x
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Firebase CLI
curl -sL https://firebase.tools | bash

# OpenJDK 17
sudo apt install -y openjdk-17-jdk

# Android Studio (via snap)
sudo snap install android-studio --classic

echo "✅ Linux development environment is now set up!"
EOF
