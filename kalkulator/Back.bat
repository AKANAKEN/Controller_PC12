@echo off
color B
:menu
cls
echo ====================================
echo | Pilih file yang ingin dijalankan |
echo ====================================
echo | 1. | Keluar			|
echo | 2. | Kembali ke halaman Utama	|
echo ====================================
set /p choice=Masukkan pilihan : 

if "%choice%"=="1" goto end
if "%choice%"=="2" goto file2

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu


:file1
cls
call ..\Program.bat
goto end

:end
echo Terimakasih atas penggunaan programnya
echo Created By Akanaken
pause
goto menu
