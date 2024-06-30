@echo off
echo =====================================================
echo            Informasi Monitor
echo =====================================================
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
