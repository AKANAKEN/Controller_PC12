@echo off
echo Menjalankan BatteryInfoView...
BatteryInfoView.exe > output.txt
echo Hasil telah disimpan di output.txt
type output.txt
pause