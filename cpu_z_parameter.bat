@echo off
echo =========================================
echo          Status CPU Menggunakan CPU-Z
echo =========================================
echo.

rem Menentukan path ke CPU-Z
set CPUZ_PATH="C:\Users\AKANAKEN\Documents\myProgram bat\cpuz.exe"

rem Menjalankan CPU-Z dan menyimpan output ke file sementara
%CPUZ_PATH% -txt=cpuz_report

rem Menampilkan pesan sementara menunggu data diambil
echo Mengambil informasi CPU dari CPU-Z...
echo.

rem Menunggu beberapa detik untuk memastikan laporan dibuat
timeout /t 5 /nobreak >nul

rem Menampilkan isi dari laporan CPU-Z
type cpuz_report.txt

rem Menghapus file sementara setelah digunakan
del cpuz_report.txt

pause
