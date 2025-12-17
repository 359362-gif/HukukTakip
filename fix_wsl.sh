#!/bin/bash
echo "WSL sorunları düzeltiliyor..."

# dpkg sorununu düzelt
sudo dpkg --configure -a

# Sistem güncellemesi
sudo apt update

# Gerekli paketler
sudo apt install -y python3-pip python3-venv git zip unzip openjdk-11-jdk autoconf libtool pkg-config zlib1g-dev libncurses-dev libtinfo-dev cmake libffi-dev libssl-dev

# Virtual environment oluştur
python3 -m venv venv
source venv/bin/activate

# Buildozer kur
pip install buildozer==1.5.0 cython==0.29.33

# APK oluştur
buildozer android debug

echo "APK oluşturma tamamlandı!"
