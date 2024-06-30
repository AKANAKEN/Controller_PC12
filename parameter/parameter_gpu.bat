@echo off
echo =====================================================
echo         Informasi Lengkap GPU Menggunakan WMIC
echo =====================================================
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
