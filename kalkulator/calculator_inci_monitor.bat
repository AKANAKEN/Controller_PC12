@echo off
set /p height_mm="Masukkan tinggi monitor (dalam mm): "
set /p width_mm="Masukkan lebar monitor (dalam mm): "

:: Konversi mm ke inci
set /a height_in=height_mm/25.4
set /a width_in=width_mm/25.4

:: Hitung kuadrat dari tinggi dan lebar dalam inci
set /a height_in_squared=height_in*height_in
set /a width_in_squared=width_in*width_in
set /a sum=height_in_squared+width_in_squared

:: Menggunakan PowerShell untuk menghitung akar kuadrat
for /f %%i in ('powershell -command "[math]::sqrt(%sum%)"') do set diagonal_in=%%i

echo Ukuran diagonal monitor adalah: %diagonal_in% inci
pause
goto pilih


:pilih
echo -
echo =============================
echo Pilih tujuan selanjutnya :
echo =============================
echo 1. Buat Halaman Baru
echo 2. Pergi ke Halaman Utama
echo =============================
set /p choice=Masukkan pilihan (1-2): 

if %choice%==1 goto file1
if %choice%==2 goto file2

if %choice%==exit goto end

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu

:file1
echo -
echo ===========================
echo hitungan baru
echo ===========================
call calculator_inci_monitor.bat
goto end

:file2
call Program.bat
goto end
:end
echo Selesai menjalankan file.
pause