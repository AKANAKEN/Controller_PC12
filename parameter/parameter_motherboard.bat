@echo off
echo =====================================================
echo            Informasi Motherboard
echo =====================================================
echo.

rem Informasi Motherboard
echo Informasi Motherboard:
wmic baseboard get Manufacturer,Product,SerialNumber /format:table
echo.

wmic baseboard get Version,Name,Status,PoweredOn /format:table
echo.

rem Informasi BIOS
echo Informasi BIOS:
wmic bios get Manufacturer,Version /format:table
echo.

wmic bios get SMBIOSBIOSVersion,ReleaseDate /format:table
echo.



pause
