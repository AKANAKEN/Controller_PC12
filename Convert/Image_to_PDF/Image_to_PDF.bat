@echo off
:menu
cls
echo ===========================
echo Pilih program Python yang ingin dijalankan:
echo 1. convrt.py
echo 2. Installer
echo 3. Keluar
echo ===========================
set /p choice=Masukkan pilihan (1-2): 

if "%choice%"=="1" (
    echo Menjalankan convrt.py...
    python convrt.py
) else if "%choice%"=="2" (
    echo Menjalankan Installer...
    call Installer.bat
) else if "%choice%"=="3" (
    echo Keluar dari program.
    exit /b
) else (
    echo Pilihan tidak valid. Silakan coba lagi.
    pause
    goto menu
)

pause