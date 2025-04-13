@echo off
REM Ubah warna konsol
color b

REM Periksa apakah Python tersedia di sistem
python --version >nul 2>&1
if errorlevel 1 (
    echo Python tidak ditemukan. Pastikan Python terinstal dan tambahkan ke PATH.
    pause
    exit /b
)

REM Jalankan skrip Python
python Downloader.py

REM Tunggu input sebelum menutup konsol
pause
