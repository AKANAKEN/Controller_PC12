@echo off
setlocal enabledelayedexpansion

:: File untuk menyimpan data terenkripsi
set data_file=data.txt

:: Karakter substitusi untuk enkripsi dan dekripsi
set "key=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "cipher=fghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcde"

:: Fungsi untuk mengenkripsi teks
:encrypt
set "result="
setlocal enabledelayedexpansion
for /l %%i in (0,1,127) do (
    set "char=!text:~%%i,1!"
    if "!char!"=="" goto end_encrypt
    for /l %%j in (0,1,61) do (
        if "!char!"=="!key:~%%j,1!" set "result=!result!!cipher:~%%j,1!"
    )
)
:end_encrypt
endlocal & set "encrypted_text=%result%"
goto :eof

:: Fungsi untuk mendekripsi teks
:decrypt
set "result="
setlocal enabledelayedexpansion
for /l %%i in (0,1,127) do (
    set "char=!text:~%%i,1!"
    if "!char!"=="" goto end_decrypt
    for /l %%j in (0,1,61) do (
        if "!char!"=="!cipher:~%%j,1!" set "result=!result!!key:~%%j,1!"
    )
)
:end_decrypt
endlocal & set "decrypted_text=%result%"
goto :eof

:: Menu utama
:menu
cls
echo ==============================
echo    Account Management System
echo ==============================
echo 1. Tambah Data
echo 2. Lihat Data
echo 3. Keluar
echo ==============================
set /p choice="Pilih opsi (1-3): "

if "%choice%"=="1" goto :tambah_data
if "%choice%"=="2" goto :lihat_data
if "%choice%"=="3" exit
goto :menu

:: Fungsi untuk menambah data
:tambah_data
cls
set /p nama_account="Masukkan Nama Account: "
set /p username="Masukkan Username: "
set /p password="Masukkan Password: "

:: Gabung data
set "text=%nama_account%,%username%,%password%"

:: Enkripsi data
call :encrypt

:: Simpan data terenkripsi ke file
echo %encrypted_text% >> %data_file%
echo Data berhasil ditambahkan!
pause
goto :menu

:: Fungsi untuk melihat data
:lihat_data
cls
if not exist %data_file% (
    echo Tidak ada data untuk ditampilkan.
    pause
    goto :menu
)

echo Data Accounts:
echo -----------------------------
for /f "tokens=* delims=" %%A in (%data_file%) do (
    set "text=%%A"
    call :decrypt
    echo %decrypted_text%
)
echo -----------------------------
pause
goto :menu
