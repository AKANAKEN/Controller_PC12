@echo off
color B
:menu
cls
echo =====================================
echo = Pilih file yang ingin dijalankan: =
echo =====================================
echo ! 1 !  Parameter CPU                 =
echo ! 2 !  Parameter GPU                 =
echo ! 3 !  Parameter Monitor             =
echo ! 4 !  Parameter Motherboard         =
echo ! 5 !  Parameter RAM                 =
echo ! 6 !  Parameter Storage             =
echo ! 7 !  Parameter Wireless            =
echo ! 8 !  Back                          =
echo =====================================
set /p choice=Masukkan pilihan (1-8): 

if %choice%==1 goto file1
if %choice%==2 goto file2
if %choice%==3 goto file3
if %choice%==4 goto file4
if %choice%==5 goto file5
if %choice%==6 goto file6
if %choice%==7 goto file7
if %choice%==8 goto back

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu

:back
call Home_Program.bat

:file1
cls
echo ============================================
echo !       Parameter CPU menggunakan PowerShell !
echo ============================================
echo.
powershell -Command "Get-WmiObject Win32_Processor | ForEach-Object { Write-Output ('Name' + [char]9 + $_.Name); Write-Output ('NumberOfCores' + [char]9 + $_.NumberOfCores); Write-Output ('NumberOfLogicalProcessors' + [char]9 + $_.NumberOfLogicalProcessors); Write-Output ('MaxClockSpeed' + [char]9 + $_.MaxClockSpeed); Write-Output ('Caption' + [char]9 + $_.Caption); Write-Output ('Manufacturer' + [char]9 + $_.Manufacturer); Write-Output ('ProcessorId' + [char]9 + $_.ProcessorId); Write-Output ('SocketDesignation' + [char]9 + $_.SocketDesignation); Write-Output ('Architecture' + [char]9 + $_.Architecture); Write-Output ('Family' + [char]9 + $_.Family); Write-Output ('Version' + [char]9 + $_.Version); Write-Output ('L2CacheSize' + [char]9 + $_.L2CacheSize); Write-Output ('L3CacheSize' + [char]9 + $_.L3CacheSize) }"
pause
goto menu

:file2
cls
echo ============================================
echo !       Parameter GPU menggunakan PowerShell !
echo ============================================
echo.
powershell -Command "Get-WmiObject Win32_VideoController | ForEach-Object { Write-Output ('Caption' + [char]9 + $_.Caption); Write-Output ('AdapterRAM' + [char]9 + $_.AdapterRAM); Write-Output ('AdapterCompatibility' + [char]9 + $_.AdapterCompatibility); Write-Output ('VideoArchitecture' + [char]9 + $_.VideoArchitecture); Write-Output ('VideoMemoryType' + [char]9 + $_.VideoMemoryType); Write-Output ('VideoProcessor' + [char]9 + $_.VideoProcessor); Write-Output ('DriverVersion' + [char]9 + $_.DriverVersion); Write-Output ('DriverDate' + [char]9 + $_.DriverDate); Write-Output ('CurrentRefreshRate' + [char]9 + $_.CurrentRefreshRate); Write-Output ('MaxRefreshRate' + [char]9 + $_.MaxRefreshRate); Write-Output ('VideoModeDescription' + [char]9 + $_.VideoModeDescription) }"
pause
goto menu

:file3
cls
echo ============================================
echo !    Parameter Monitor menggunakan PowerShell !
echo ============================================
echo.
powershell -Command "Get-WmiObject Win32_DesktopMonitor | ForEach-Object { Write-Output ('DeviceID' + [char]9 + $_.DeviceID); Write-Output ('Name' + [char]9 + $_.Name); Write-Output ('ScreenHeight' + [char]9 + $_.ScreenHeight); Write-Output ('ScreenWidth' + [char]9 + $_.ScreenWidth); Write-Output ('Description' + [char]9 + $_.Description); Write-Output ('PNPDeviceID' + [char]9 + $_.PNPDeviceID); Write-Output ('PixelsPerXLogicalInch' + [char]9 + $_.PixelsPerXLogicalInch); Write-Output ('PixelsPerYLogicalInch' + [char]9 + $_.PixelsPerYLogicalInch) }"
pause
goto menu

:file4
cls
echo ====================================================
echo !       Parameter Motherboard menggunakan PowerShell !
echo ====================================================
echo.
powershell -Command "Get-WmiObject Win32_BaseBoard | ForEach-Object { Write-Output ('Manufacturer' + [char]9 + $_.Manufacturer); Write-Output ('Product' + [char]9 + $_.Product); Write-Output ('SerialNumber' + [char]9 + $_.SerialNumber); Write-Output ('Version' + [char]9 + $_.Version); Write-Output ('Name' + [char]9 + $_.Name); Write-Output ('Status' + [char]9 + $_.Status); Write-Output ('PoweredOn' + [char]9 + $_.PoweredOn) }"
echo Informasi BIOS:
echo ====================================================
powershell -Command "Get-WmiObject Win32_BIOS | ForEach-Object { Write-Output ('Manufacturer' + [char]9 + $_.Manufacturer); Write-Output ('Version' + [char]9 + $_.Version); Write-Output ('SMBIOSBIOSVersion' + [char]9 + $_.SMBIOSBIOSVersion); Write-Output ('ReleaseDate' + [char]9 + $_.ReleaseDate) }"
pause
goto menu

:file5
cls
echo ============================================
echo !       Parameter RAM menggunakan PowerShell !
echo ============================================
echo.
powershell -Command "Get-WmiObject Win32_PhysicalMemory | ForEach-Object { Write-Output ('Capacity' + [char]9 + $_.Capacity); Write-Output ('Manufacturer' + [char]9 + $_.Manufacturer); Write-Output ('Speed' + [char]9 + $_.Speed); Write-Output ('MemoryType' + [char]9 + $_.MemoryType); Write-Output ('FormFactor' + [char]9 + $_.FormFactor); Write-Output ('SerialNumber' + [char]9 + $_.SerialNumber); Write-Output ('PartNumber' + [char]9 + $_.PartNumber); Write-Output ('ConfiguredClockSpeed' + [char]9 + $_.ConfiguredClockSpeed) }"
pause
goto menu

:file6
cls
echo ====================================================
echo !       Parameter Storage menggunakan PowerShell !
echo ====================================================
echo.
powershell -Command "Get-WmiObject Win32_DiskDrive | ForEach-Object { Write-Output ('Caption' + [char]9 + $_.Caption); Write-Output ('DeviceID' + [char]9 + $_.DeviceID); Write-Output ('Model' + [char]9 + $_.Model); Write-Output ('Size' + [char]9 + $_.Size); Write-Output ('MediaType' + [char]9 + $_.MediaType); Write-Output ('SerialNumber' + [char]9 + $_.SerialNumber); Write-Output ('InterfaceType' + [char]9 + $_.InterfaceType); Write-Output ('Partitions' + [char]9 + $_.Partitions); Write-Output ('Status' + [char]9 + $_.Status); Write-Output ('Manufacturer' + [char]9 + $_.Manufacturer); Write-Output ('Signature' + [char]9 + $_.Signature); Write-Output ('TotalHeads' + [char]9 + $_.TotalHeads); Write-Output ('TracksPerCylinder' + [char]9 + $_.TracksPerCylinder) }"
pause
goto menu

:file7
cls
echo ====================================================
echo !       Parameter Wireless menggunakan PowerShell !
echo ====================================================
echo.
powershell -Command "Get-WmiObject Win32_NetworkAdapter | ForEach-Object { Write-Output ('Name' + [char]9 + $_.Name); Write-Output ('NetConnectionID' + [char]9 + $_.NetConnectionID); Write-Output ('Speed' + [char]9 + $_.Speed) }"
echo Informasi Bluetooth:
echo ====================================================
powershell -Command "Get-WmiObject Win32_PnPEntity | Where-Object { $_.Name -like '*Bluetooth*' } | ForEach-Object { Write-Output ('Name' + [char]9 + $_.Name); Write-Output ('Description' + [char]9 + $_.Description); Write-Output ('Manufacturer' + [char]9 + $_.Manufacturer); Write-Output ('DeviceID' + [char]9 + $_.DeviceID); Write-Output ('Status' + [char]9 + $_.Status) }"
pause
goto menu

:end
echo Selesai menjalankan file.
pause
