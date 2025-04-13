@echo off
setlocal enabledelayedexpansion

:: File untuk menyimpan data
set data_file=data.txt

:: Fungsi untuk menampilkan menu utama
:menu
cls
echo ==============================
echo    Account Management System
echo ==============================
echo 1. Tambah Data
echo 2. Ubah Data
echo 3. Hapus Data
echo 4. Cari Data
echo 5. Keluar
echo ==============================
set /p choice="Pilih opsi (1-5): "

if "%choice%"=="1" goto :tambah_data
if "%choice%"=="2" goto :ubah_data
if "%choice%"=="3" goto :hapus_data
if "%choice%"=="4" goto :cari_data
if "%choice%"=="5" exit
goto :menu

:: Fungsi untuk menambah data
:tambah_data
cls
set /p nama_account="Masukkan Nama Account: "
set /p username="Masukkan Username: "
set /p password="Masukkan Password: "

:: Menyimpan data ke file
echo = %nama_account% = >> %data_file%
echo ============================== >> %data_file%
echo %nama_account%,%username%,%password% >> %data_file%
echo ============================== >> %data_file%
echo Data berhasil ditambahkan!
pause
goto :menu

:: Fungsi untuk mengubah data
:ubah_data
cls
set /p cari_nama="Masukkan Nama Account yang ingin diubah: "
if not exist %data_file% (
    echo Data tidak ditemukan.
    pause
    goto :menu
)

:: Menyimpan data sementara ke file temporary
set found=0
(for /f "tokens=1,2,3 delims=," %%a in (%data_file%) do (
    if /i "%%a"=="%cari_nama%" (
        echo Data ditemukan:
        echo Nama Account: %%a
        echo Username: %%b
        echo Password: %%c
        echo.
        set /p nama_account="Masukkan Nama Account Baru (atau tekan Enter untuk tidak mengubah): "
        if not defined nama_account set nama_account=%%a
        set /p username="Masukkan Username Baru (atau tekan Enter untuk tidak mengubah): "
        if not defined username set username=%%b
        set /p password="Masukkan Password Baru (atau tekan Enter untuk tidak mengubah): "
        if not defined password set password=%%c
        echo %nama_account%,%username%,%password%
        set found=1
    ) else (
        echo %%a,%%b,%%c
    )
)) > temp.txt

move /Y temp.txt %data_file% > nul

if "%found%"=="0" (
    echo Data dengan Nama Account %cari_nama% tidak ditemukan.
) else (
    echo Data berhasil diubah!
)
pause
goto :menu

:: Fungsi untuk menghapus data
:hapus_data
cls
set /p cari_nama="Masukkan Nama Account yang ingin dihapus: "
if not exist %data_file% (
    echo Data tidak ditemukan.
    pause
    goto :menu
)

:: Menyimpan data sementara ke file temporary
set found=0
(for /f "tokens=1,2,3 delims=," %%a in (%data_file%) do (
    if /i "%%a"=="%cari_nama%" (
        set found=1
    ) else (
        echo %%a,%%b,%%c
    )
)) > temp.txt

move /Y temp.txt %data_file% > nul

if "%found%"=="0" (
    echo Data dengan Nama Account %cari_nama% tidak ditemukan.
) else (
    echo Data berhasil dihapus!
)
pause
goto :menu

:: Fungsi untuk mencari data
:cari_data
cls
echo Daftar Nama Account yang Tersedia:
echo ------------------------------
:: Menampilkan daftar nama akun yang ada
for /f "tokens=1 delims=," %%a in (%data_file%) do (
    echo %%a
)

echo ------------------------------
set /p cari_nama="Masukkan Nama Account yang ingin dicari: "
if not exist %data_file% (
    echo Data tidak ditemukan.
    pause
    goto :menu
)

:: Menampilkan data yang sesuai
set found=0
for /f "tokens=1,2,3 delims=," %%a in (%data_file%) do (
    if /i "%%a"=="%cari_nama%" (
        echo Nama Account: %%a
        echo Username: %%b
        echo Password: %%c
        set found=1
    )
)

if "%found%"=="0" (
    echo Data dengan Nama Account %cari_nama% tidak ditemukan.
)
pause
goto :menu
