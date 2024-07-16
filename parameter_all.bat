@echo off
color B
:menu
cls
echo =====================================
echo = Pilih file yang ingin dijalankan: =
echo =====================================
echo ! 1 !  Parameter CPU		 =
echo ! 2 !  Parameter GPU		 =
echo ! 3 !  Parameter Monitor		 =
echo ! 4 !  Parameter Motherboard	 =	
echo ! 5 !  Parameter RAM		 =	 
echo ! 6 !  Parameter Storage		 =	
echo ! 7 !  Parameter Wireless		 =	
echo =====================================
set /p choice=Masukkan pilihan (1-4): 

if %choice%==1 goto file1
if %choice%==2 goto file2
if %choice%==3 goto file3
if %choice%==4 goto file4
if %choice%==5 goto file5
if %choice%==6 goto file6
if %choice%==7 goto file7

if %choice%==exit goto end

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu

:file1
cls
echo ============================================
echo !       Parameter CPU menggunakan WMIC	!
echo ============================================
echo.

rem Mengambil dan menampilkan informasi prosesor yang lebih lengkap
echo Informasi Prosesor:
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors /format:table
echo.

wmic cpu get MaxClockSpeed,Caption,Manufacturer /format:table
echo.


wmic cpu get ProcessorId,SocketDesignation,Architecture /format:table
echo.

wmic cpu get Family,Version,L2CacheSize,L3CacheSize /format:table
echo.

pause
goto menu



:file2
cls
echo ============================================
echo !       Parameter GPU menggunakan WMIC	!
echo ============================================
echo.

rem Mengambil dan menampilkan informasi GPU
echo Informasi GPU:
wmic path win32_videocontroller get Caption,AdapterRAM,AdapterCompatibility /format:table
echo.

wmic path win32_videocontroller get VideoArchitecture,VideoMemoryType,VideoProcessor /format:table
echo.

wmic path win32_videocontroller get DriverVersion,DriverDate,CurrentRefreshRate /format:table
echo.

wmic path win32_videocontroller get MaxRefreshRate,VideoModeDescription /format:table
echo.

pause

goto menu


:file3
cls
echo ============================================
echo !    Parameter Monitor menggunakan WMIC	!
echo ============================================
echo.

rem Informasi Monitor
echo Informasi Monitor:
wmic path Win32_DesktopMonitor get DeviceID,Name,ScreenHeight,ScreenWidth /format:table
echo.

wmic path Win32_DesktopMonitor get Description,DeviceID,PNPDeviceID,PixelsPerXLogicalInch /format:table
echo.

wmic path Win32_DesktopMonitor get PixelsPerYLogicalInch,PNPDeviceID /format:table
echo.

pause

goto menu

:file4
cls
echo ====================================================
echo !       Parameter Motherboard menggunakan WMIC	!
echo ====================================================
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

goto menu

:file5
cls
echo ============================================
echo !       Parameter RAM menggunakan WMIC	!
echo ============================================
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

goto menu

:file6
cls
echo ====================================================
echo !       Parameter Storage menggunakan WMIC		!
echo ====================================================
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

goto menu


:file7
cls
echo ====================================================
echo !       Parameter Wireless menggunakan WMIC	!
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


goto menu


:end
echo Selesai menjalankan file.
pause