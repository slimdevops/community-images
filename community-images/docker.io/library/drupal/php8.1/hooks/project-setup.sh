#!/usr/bin/env bash
sudo apt install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath
sudo apt install -y composer
# sudo wget --no-verbose -O /tmp/chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_98.0.4758.102-1_amd64.deb

# echo "Chrome ======> $(google-chrome --version)"
# sudo apt install -y --allow-downgrades /tmp/chrome.deb
# sudo rm /tmp/chrome.deb
# echo "Chrome ======> $(google-chrome --version)"
curl -s https://deb.nodesource.com/setup_16.x | sudo bash
sudo apt install nodejs -y
npm install -g yarn

mkdir drupal_vol
docker volume create --opt type=none --opt o=bind --opt device=$(pwd)/drupal_vol drupal_vol
