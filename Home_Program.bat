@echo off
color B
:menu
cls
echo =============================
echo Pilih file yang ingin dijalankan:
echo =============================
echo 1. Parameter
echo 2. Kalkulator
echo 3. Speedtest (Okla)
echo 4. Wifi Data
echo =============================
echo Program khusus 
echo tmp untuk menghapus file sampah 
echo =============================
set /p choice=Masukkan pilihan (1-4/tmp): 

if %choice%==1 goto file1
if %choice%==2 goto file2
if %choice%==3 goto file3
if %choice%==4 goto file4
if %choice%==tmp goto file_tmp

if %choice%==exit goto end

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu

:file_tmp
call hapus_temp.bat

:file1
call parameter_all.bat


:file2
call Halaman_Kalkulator.bat
goto end

:file3
call speedtest.exe
goto end

:file4
call wifi.bat
goto end

:end
echo Selesai menjalankan file.
pause