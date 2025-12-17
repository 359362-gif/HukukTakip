#!/bin/bash
echo "WSL ile APK oluşturuluyor..."

# Sistem güncellemesi
sudo apt update
sudo apt install -y git zip unzip openjdk-11-jdk python3-pip autoconf libtool pkg-config zlib1g-dev libncurses-dev libtinfo-dev cmake libffi-dev libssl-dev

# Python bağımlılıkları
pip3 install --upgrade pip
pip3 install buildozer==1.5.0 cython==0.29.33

# Android SDK lisanslarını kabul et
mkdir -p $HOME/.buildozer/android/platform/android-sdk/licenses
echo "24333f8a63b6825ea9c551df7318f4c5ec0e11c" > $HOME/.buildozer/android/platform/android-sdk/licenses/android-sdk-license
echo "84831b9409646a918e2411f9a982d5b93934f64" > $HOME/.buildozer/android/platform/android-sdk/licenses/android-sdk-preview-license
echo "d56f5187479451eabf01fb78af6dfcb131a6481e" > $HOME/.buildozer/android/platform/android-sdk/licenses/android-sdk-license
echo "859f317f9b6fc424e5d410066a9435b4a6e1c9a9" > $HOME/.buildozer/android/platform/android-sdk/licenses/google-gdk

# APK oluştur
buildozer android debug

echo "APK oluşturma tamamlandı!"
echo "APK dosyası bin klasöründe bulunabilir."
