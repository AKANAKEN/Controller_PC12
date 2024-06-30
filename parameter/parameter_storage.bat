@echo off
echo =========================================
echo         Status Storage Menggunakan WMIC
echo =========================================
echo.

rem Mengambil dan menampilkan informasi storage yang lebih lengkap
echo Informasi Storage:
wmic diskdrive get Caption,DeviceID,Model /format:table
echo.

wmic diskdrive get Size,MediaType,SerialNumber /format:table
echo.

wmic diskdrive get InterfaceType,Partitions,Status /format:table
echo.

wmic diskdrive get Manufacturer,Signature,TotalHeads,TracksPerCylinder /format:table
echo.

pause
