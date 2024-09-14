@echo off
color b
setlocal enabledelayedexpansion

:: File untuk menyimpan data website
set data_file=websites.txt

:: Fungsi untuk menampilkan menu utama
:menu
cls
echo ==============================
echo    Website Manager
echo ==============================
echo 1. Tambah Website
echo 2. Lihat Daftar Website
echo 3. Buka Website
echo 4. Keluar
echo ==============================
set /p choice="Pilih opsi (1-4): "

if "%choice%"=="1" goto :tambah_website
if "%choice%"=="2" goto :lihat_website
if "%choice%"=="3" goto :buka_website
if "%choice%"=="4" exit
goto :menu

:: Fungsi untuk menambah website baru
:tambah_website
cls
set /p nama_website="Masukkan Nama Website: "
set /p link_website="Masukkan Link Website (dengan http/https): "

:: Menyimpan data website ke file
echo %nama_website%,%link_website% >> %data_file%
echo Website berhasil ditambahkan!
pause
goto :menu

:: Fungsi untuk menampilkan daftar website
:lihat_website
cls
if not exist %data_file% (
    echo Tidak ada website yang tersimpan.
    pause
    goto :menu
)

echo Daftar Website:
echo ------------------------------
for /f "tokens=1,2 delims=," %%a in (%data_file%) do (
    echo Nama Website: %%a
    echo Link Website : %%b
    echo ------------------------------
)
pause
goto :menu

:: Fungsi untuk membuka website
:buka_website
cls
if not exist %data_file% (
    echo Tidak ada website yang tersimpan.
    pause
    goto :menu
)

echo Daftar Website:
echo ------------------------------
set index=0
for /f "tokens=1,2 delims=," %%a in (%data_file%) do (
    set /a index+=1
    echo !index!. Nama Website: %%a
    set "website[!index!]=%%b"
)
echo ------------------------------
set /p pilihan="Pilih nomor website yang ingin dibuka: "

:: Validasi input pilihan
if not defined website[%pilihan%] (
    echo Pilihan tidak valid.
    pause
    goto :menu
)

:: Membuka website yang dipilih
set link=!website[%pilihan%]!
start "" "!link!"
echo Membuka !link!
pause
goto :menu
