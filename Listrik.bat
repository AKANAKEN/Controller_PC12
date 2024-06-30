@echo off
echo.
echo ================================================
echo Informasi Baterai dan Penggunaan Daya
echo ================================================
echo.

:: Menampilkan status baterai
echo Status Baterai:
wmic path Win32_Battery get EstimatedChargeRemaining, BatteryStatus, PowerOnline
echo.

:: Menampilkan informasi daya
echo Informasi Penggunaan Daya:
powercfg /batteryreport /output %USERPROFILE%\battery_report.html
echo Laporan baterai telah dibuat di: %USERPROFILE%\battery_report.html
echo.

:: Menunggu input dari user sebelum menutup
pause
