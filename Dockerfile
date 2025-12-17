FROM python:3.9-slim

# Sistem bağımlılıkları
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    openjdk-11-jdk \
    python3-pip \
    autoconf \
    libtool \
    pkg-config \
    zlib1g-dev \
    libncurses-dev \
    libtinfo-dev \
    cmake \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Python bağımlılıkları
RUN pip install --upgrade pip
RUN pip install buildozer==1.5.0 cython==0.29.33

# Çalışma dizini
WORKDIR /app

# Dosyaları kopyala
COPY . .

# Android SDK lisanslarını kabul et
RUN mkdir -p $ANDROID_HOME/licenses
RUN echo "24333f8a63b6825ea9c551df7318f4c5ec0e11c" > $ANDROID_HOME/licenses/android-sdk-license
RUN echo "84831b9409646a918e2411f9a982d5b93934f64" > $ANDROID_HOME/licenses/android-sdk-preview-license
RUN echo "d56f5187479451eabf01fb78af6dfcb131a6481e" > $ANDROID_HOME/licenses/android-sdk-license
RUN echo "859f317f9b6fc424e5d410066a9435b4a6e1c9a9" > $ANDROID_HOME/licenses/google-gdk

# APK oluştur
RUN buildozer android debug
