@echo off
echo ====================================================
echo        Informasi WiFi dan Bluetooth Menggunakan WMIC
echo ====================================================
echo.

rem Informasi WiFi
echo Informasi WiFi:
wmic nic get Name,NetConnectionID,Speed /format:table
echo.

rem Informasi Bluetooth
echo Informasi Bluetooth:
wmic path get Name,Description,Manufacturer,DeviceID,Status /format:table
echo.

pause
