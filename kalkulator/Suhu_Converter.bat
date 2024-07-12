@echo off
setlocal enabledelayedexpansion

:menu
cls
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

call Program.bat
goto end