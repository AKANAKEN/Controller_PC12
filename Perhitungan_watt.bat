@echo off
setlocal enabledelayedexpansion
color b

:menu
echo ==========================
echo Program Converter By [Akanaken]
echo ==========================
echo Pilih perhitungan yang diinginkan:
echo 1. Bit ke Byte
echo 2. Watt (Tegangan x Arus)
set /p choice=Masukkan pilihan (1 atau 2):

if "%choice%"=="1" goto bit_to_byte
if "%choice%"=="2" goto watt_calculation

echo Pilihan tidak valid.
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
goto end

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
goto end

:end
pause

call Program.bat
goto end