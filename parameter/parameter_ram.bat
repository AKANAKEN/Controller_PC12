@echo off
echo =========================================
echo         Status RAM Menggunakan WMIC
echo =========================================
echo.

rem Mengambil dan menampilkan informasi RAM yang lebih lengkap
echo Informasi RAM:
wmic memorychip get Capacity,Manufacturer,Speed /format:table
echo.

wmic memorychip get MemoryType,FormFactor,SerialNumber /format:table
echo.

wmic memorychip get PartNumber,ConfiguredClockSpeed /format:table
echo.

pause
