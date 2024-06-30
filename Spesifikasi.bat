@echo off
echo.
color B
echo ================================================
echo Informasi Spesifikasi Komputer Detil
echo ================================================
echo.

:: Menampilkan nama motherboard
echo Informasi Motherboard:
wmic baseboard get Manufacturer, Product, Version, SerialNumber
echo.

:: Menampilkan informasi RAM
echo Informasi RAM:
wmic memorychip get Manufacturer, Capacity, Speed, PartNumber
echo.

:: Menampilkan informasi prosesor
echo Informasi Prosesor:
wmic cpu get Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed
echo.

:: Menampilkan jenis dan kapasitas storage
echo Informasi Storage:
wmic diskdrive get Model, InterfaceType, MediaType, Size
echo.

:: Menampilkan informasi monitor
echo Informasi Monitor:
wmic path win32_desktopmonitor get Caption, MonitorType, ScreenHeight, ScreenWidth
echo.

:: Menampilkan informasi WiFi
echo Informasi WiFi Adapter:
wmic nic where "NetEnabled=true and AdapterTypeID=9" get Name, Manufacturer, MACAddress
echo.

:: Menampilkan informasi Bluetooth
echo Informasi Bluetooth Adapter:
wmic path Win32_PnPEntity where "Name like '%%Bluetooth%%'" get Name, Manufacturer
echo.

:: Menampilkan informasi VGA (kartu grafis)
echo Informasi Kartu Grafis (VGA):
wmic path win32_videocontroller get Name, AdapterRAM, DriverVersion
echo.

:: Menunggu input dari user sebelum menutup
pause

