@echo off
echo.
color B
echo ================================================
echo Sistem Informasi Komputer
echo ================================================
echo.

:: Menampilkan nama komputer
echo Nama Komputer: %COMPUTERNAME%
echo.

:: Menampilkan nama user yang sedang login
echo Nama Pengguna: %USERNAME%
echo.

:: Menampilkan sistem operasi
echo Sistem Operasi:
systeminfo | findstr /B /C:"OS Name"
systeminfo | findstr /B /C:"OS Version"
echo.

:: Menampilkan informasi prosesor
echo Informasi Prosesor:
wmic cpu get Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed
echo.

:: Menampilkan informasi BIOS
echo Informasi BIOS:
wmic bios get Manufacturer, Name, Version
echo.

:: Menampilkan informasi memori
echo Informasi Memori (RAM):
systeminfo | findstr /C:"Total Physical Memory"
systeminfo | findstr /C:"Available Physical Memory"
echo.

:: Menampilkan informasi disk
echo Informasi Disk:
wmic logicaldisk get Name, FileSystem, FreeSpace, Size, VolumeName
echo.

:: Menampilkan alamat IP
echo Alamat IP:
ipconfig | findstr /R /C:"IPv4 Address"
echo.

:: Menampilkan MAC Address
echo MAC Address:
getmac /v /fo list
echo.

:: Menampilkan waktu sistem
echo Waktu Sistem:
time /T
date /T
echo.

:: Menunggu input dari user sebelum menutup
pause

call Program.bat
goto end