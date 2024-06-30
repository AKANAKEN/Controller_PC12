@echo off
echo =========================================
echo         Status CPU Menggunakan WMIC
echo =========================================
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
