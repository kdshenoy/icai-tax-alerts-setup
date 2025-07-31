cd linux
cat > install-linux.sh << 'EOF'
#!/usr/bin/env bash
set -e
sudo apt update
sudo apt install -y git nodejs npm openjdk-11-jdk
sudo snap install android-studio --classic
sudo npm install -g firebase-tools
echo "✅ Linux dependencies installed!"
EOF
chmod +x install-linux.sh
cd ..
