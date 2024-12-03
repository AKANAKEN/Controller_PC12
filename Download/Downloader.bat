@echo off
color b

:: Mendapatkan direktori saat ini
set "CURRENT_DIR=%~dp0"

:: Lokasi yt-dlp.exe
set "YT_DLP_PATH=%CURRENT_DIR%yt-dlp.exe"

:: Folder tempat file akan di-download
set "DOWNLOAD_FOLDER=%CURRENT_DIR%"

:menu
:: Membersihkan layar
cls
echo ========================================
echo        Link YouTube Downloader
echo ========================================
echo.

:: Minta user memasukkan URL video YouTube
set /p "URL=Masukkan URL YouTube: "

:: Pilihan download (video atau audio)
echo Pilih format:
echo 1. Video (MP4)
echo 2. Audio (MP3)
set /p "CHOICE=Masukkan pilihan (1 and 2): "

if "%CHOICE%"=="1" (
    echo Mendownload video dalam format MP4...
    "%YT_DLP_PATH%" -o "%DOWNLOAD_FOLDER%\%(title)s.%(ext)s" --recode-video mp4 "%URL%"
    echo Video berhasil diunduh di %DOWNLOAD_FOLDER%.
) else if "%CHOICE%"=="2" (
    echo Mendownload audio dalam format MP3...
    "%YT_DLP_PATH%" -o "%DOWNLOAD_FOLDER%\%(title)s.%(ext)s" --extract-audio --audio-format mp3 "%URL%"
    echo Audio berhasil diunduh di %DOWNLOAD_FOLDER%.
) else (
    echo Pilihan tidak valid. Silakan coba lagi.
goto menu1
)

goto file2


:file2
color b
cls
:: Mengatur tampilan
setlocal enabledelayedexpansion

:: Menampilkan daftar file dengan ekstensi .mp3 dan .mp4
echo Daftar file di folder ini:
dir /b *.mp3 *.mp4 > temp_files.txt
echo.

:: Mendapatkan file pertama dari daftar
set "filelama="
for /f "delims=" %%A in ('type temp_files.txt ^| findstr /n "^" ^| findstr "^1:"') do (
    set "filelama=%%A"
    set "filelama=!filelama:1:=!"
)
if not defined filelama (
    echo Tidak ada file .mp3 atau .mp4 di folder ini.
    del temp_files.txt
    pause
    exit /b
)

:: Menampilkan nama file yang diambil
echo File pertama yang terdeteksi: %filelama%
echo.

:: Meminta nama file yang ingin diubah
set /p "filelama=Masukkan nama file (termasuk ekstensi) yang ingin diubah (default: %filelama%): "
if "%filelama%"=="" set "filelama=%filelama%"

if not exist "%filelama%" (
    echo File tidak ditemukan!
    del temp_files.txt
    pause
    exit /b
)

:: Mendapatkan ekstensi file
for %%A in ("%filelama%") do set ekstensi=%%~xA

:: Meminta nama file baru tanpa mengubah ekstensi
echo [ubah tanpa menggunakan Simbol]
set /p "filebaru=Masukkan nama file baru (tanpa ekstensi): "

:: Menggabungkan nama baru dengan ekstensi lama
set filebaru=%filebaru%%ekstensi%

:: Mengecek jika file baru sudah ada
if exist "%filebaru%" (
    echo File dengan nama "%filebaru%" sudah ada!
    del temp_files.txt
    pause
    exit /b
)

:: Mengubah nama file
rename "%filelama%" "%filebaru%"

:: Konfirmasi
if not errorlevel 1 (
    echo File berhasil diubah menjadi "%filebaru%".
) else (
    echo Gagal mengubah nama file.
)

:: Membersihkan file sementara
del temp_files.txt
goto file3

:file3
cls

@echo off
REM Cek apakah folder "Hasil" sudah ada
if not exist "Hasil" (
    mkdir Hasil
)

REM Pindahkan file MP3 dan MP4 ke folder "Hasil"
move *.mp3 Hasil >nul 2>&1
move *.mp4 Hasil >nul 2>&1

REM Beri konfirmasi
echo Semua file MP3 dan MP4 telah dipindahkan ke folder "Hasil".
goto menu1


:menu1
:: Membersihkan layar
cls
echo ========================================
echo        YouTube Downloader Batch
echo ========================================
echo.

:: Pilihan download (video atau audio)
echo Pilih format:
echo 1. Download More
echo 2. exit
set /p "CHOICE=Masukkan pilihan (1/2): "

if "%CHOICE%"=="1" (
goto menu
) else (
	exit
)
