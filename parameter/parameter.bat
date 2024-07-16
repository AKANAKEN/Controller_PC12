@echo off
color B
:menu
cls
echo =============================
echo Pilih file yang ingin dijalankan:
echo =============================
echo 1. cpu
echo 2. Perhitungan watt
echo 3. Speedtest (Okla)
echo 4. Suhu Converter
echo 5. Wifi Database
echo 6. Back
echo =============================
set /p choice=Masukkan pilihan (1-4): 

if %choice%==1 goto file1
if %choice%==2 goto file2
if %choice%==3 goto file3
if %choice%==4 goto file4
if %choice%==5 goto file5
if %choice%==6 goto file6

if %choice%==exit goto end

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu

:file1
call parameter\parameter_cpu.bat
goto end

:file2
call Perhitungan_watt.bat
goto end

:file3
call speedtest.exe
goto end

:file4
call Suhu_Converter.bat
goto end

:file5
call wifi.bat
goto end

:file6
cls
call Back.bat


:end
echo Selesai menjalankan file.
pause