@echo off
color B
:menu
cls
echo =============================
echo Pilih file yang ingin dijalankan:
echo =============================
echo 1. Bit ke Byte Converter
echo 2. Watt Calculator
echo 3. Suhu Converter
echo 4. Kalkulator Monitor
echo =============================
set /p choice=Masukkan pilihan (1-4): 

if "%choice%"=="1" goto bit_to_byte
if "%choice%"=="2" goto watt_calculation
if "%choice%"=="3" goto file3
if "%choice%"=="4" goto file4

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu


:bit_to_byte
echo Masukkan jumlah Bit:
set /p bits=
if not defined bits (
    echo Anda belum memasukkan jumlah Bit.
    goto bit_to_byte
)

set /a bytes=%bits% / 8

echo %bits% bit = %bytes% byte
pause 
goto menu


:watt_calculation
echo Masukkan nilai Tegangan (Volt):
set /p voltage=
if not defined voltage (
    echo Anda belum memasukkan nilai Tegangan.
    goto watt_calculation
)

echo Masukkan nilai Arus (Ampere):
set /p current=
if not defined current (
    echo Anda belum memasukkan nilai Arus.
    goto watt_calculation
)

set /a watt=%voltage% * %current%

echo Daya (Watt) = %watt% Watt
pause

goto menu


:file3
cls
setlocal enabledelayedexpansion

color b
echo Pilih konversi suhu yang diinginkan:
echo 1. Celsius ke Fahrenheit
echo 2. Celsius ke Kelvin
echo 3. Fahrenheit ke Celsius
echo 4. Fahrenheit ke Kelvin
echo 5. Kelvin ke Celsius
echo 6. Kelvin ke Fahrenheit
set /p choice=Masukkan pilihan (1-6):

if "%choice%"=="1" goto c_to_f
if "%choice%"=="2" goto c_to_k
if "%choice%"=="3" goto f_to_c
if "%choice%"=="4" goto f_to_k
if "%choice%"=="5" goto k_to_c
if "%choice%"=="6" goto k_to_f

echo Pilihan tidak valid.
goto menu

:c_to_f
echo Masukkan suhu dalam Celsius:
set /p celsius=
if not defined celsius (
    echo Anda belum memasukkan suhu.
    goto c_to_f
)

set /a fahrenheit=((9 * %celsius% + 160) / 5)
echo %celsius% Celsius = %fahrenheit% Fahrenheit
goto end

:c_to_k
echo Masukkan suhu dalam Celsius:
set /p celsius=
if not defined celsius (
    echo Anda belum memasukkan suhu.
    goto c_to_k
)

set /a kelvin=%celsius% + 273
echo %celsius% Celsius = %kelvin% Kelvin
goto end

:f_to_c
echo Masukkan suhu dalam Fahrenheit:
set /p fahrenheit=
if not defined fahrenheit (
    echo Anda belum memasukkan suhu.
    goto f_to_c
)

set /a celsius=((5 * %fahrenheit% - 160) / 9)
echo %fahrenheit% Fahrenheit = %celsius% Celsius
goto end

:f_to_k
echo Masukkan suhu dalam Fahrenheit:
set /p fahrenheit=
if not defined fahrenheit (
    echo Anda belum memasukkan suhu.
    goto f_to_k
)

set /a celsius=((5 * %fahrenheit% - 160) / 9)
set /a kelvin=%celsius% + 273
echo %fahrenheit% Fahrenheit = %kelvin% Kelvin
goto end

:k_to_c
echo Masukkan suhu dalam Kelvin:
set /p kelvin=
if not defined kelvin (
    echo Anda belum memasukkan suhu.
    goto k_to_c
)

set /a celsius=%kelvin% - 273
echo %kelvin% Kelvin = %celsius% Celsius
goto end

:k_to_f
echo Masukkan suhu dalam Kelvin:
set /p kelvin=
if not defined kelvin (
    echo Anda belum memasukkan suhu.
    goto k_to_f
)

set /a celsius=%kelvin% - 273
set /a fahrenheit=((9 * %celsius% + 160) / 5)
echo %kelvin% Kelvin = %fahrenheit% Fahrenheit
goto end

:end
pause

goto menu



:file4
cls
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

goto end


:end
echo Selesai menjalankan file.
pause
goto menu