@echo off
echo Docker ile APK oluşturuluyor...
echo Docker Desktop'ın açık olduğundan emin olun!

REM Docker image oluştur
docker build -t kivy-apk-builder .

REM APK oluştur
docker run --rm -v "%cd%":/app kivy-apk-builder

echo APK oluşturma tamamlandı!
echo APK dosyası bin klasöründe bulunabilir.
pause
