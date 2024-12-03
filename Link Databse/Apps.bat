@echo off
color b
setlocal enabledelayedexpansion

:: File untuk menyimpan data aplikasi
set data_file=apps.txt

:: Fungsi untuk menampilkan menu utama
:menu
cls
echo ==============================
echo         App Manager
echo ==============================
echo 1. Tambah Aplikasi
echo 2. Lihat Daftar Aplikasi
echo 3. Buka Aplikasi
echo 4. Keluar
echo ==============================
set /p choice="Pilih opsi (1-4): "

if "%choice%"=="1" goto :tambah_aplikasi
if "%choice%"=="2" goto :lihat_aplikasi
if "%choice%"=="3" goto :buka_aplikasi
if "%choice%"=="4" exit
goto :menu

:: Fungsi untuk menambah aplikasi baru
:tambah_aplikasi
cls
set /p nama_aplikasi="Masukkan Nama Aplikasi: "
set /p path_aplikasi="Masukkan Path Aplikasi (contoh: C:\Path\to\App.exe): "

:: Menyimpan data aplikasi ke file
echo %nama_aplikasi%,%path_aplikasi% >> %data_file%
echo ============================== >> %data_file%
echo Aplikasi berhasil ditambahkan!
pause
goto :menu

:: Fungsi untuk menampilkan daftar aplikasi
:lihat_aplikasi
cls
if not exist %data_file% (
    echo Tidak ada aplikasi yang tersimpan.
    pause
    goto :menu
)

echo Daftar Aplikasi:
echo ------------------------------
for /f "tokens=1,2 delims=," %%a in (%data_file%) do (
    echo Nama Aplikasi: %%a
    echo Path Aplikasi: %%b
    echo ------------------------------
)
pause
goto :menu

:: Fungsi untuk membuka aplikasi
:buka_aplikasi
cls
if not exist %data_file% (
    echo Tidak ada aplikasi yang tersimpan.
    pause
    goto :menu
)

echo Daftar Aplikasi:
echo ------------------------------
set index=0
for /f "tokens=1,2 delims=," %%a in (%data_file%) do (
    set /a index+=1
    echo !index!. Nama Aplikasi: %%a
    set "app[!index!]=%%b"
)
echo ------------------------------
set /p pilihan="Pilih nomor aplikasi yang ingin dibuka: "

:: Validasi input pilihan
if not defined app[%pilihan%] (
    echo Pilihan tidak valid.
    pause
    goto :menu
)

:: Membuka aplikasi yang dipilih
set path=!app[%pilihan%]!
start "" "!path!"
echo Membuka !path!
pause
goto :menu
