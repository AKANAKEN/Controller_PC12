@echo off
color B
:menu
cls
echo =============================
echo Pilih file yang ingin dijalankan:
echo =============================
echo 1. Perhitungan watt
echo 2. Suhu Converter
echo 3. Kalkulator Monitor
echo =============================
set /p choice=Masukkan pilihan (1-6): 

if %choice%==1 goto file1
if %choice%==2 goto file2
if %choice%==3 goto file3


if %choice%==exit goto end

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu


:file1
call Perhitungan_watt.bat
goto end

:file2
call Suhu_Converter.bat
goto end

:file3
cls
call calculator_inci_monitor.bat
goto end

:end
echo Selesai menjalankan file.
pause