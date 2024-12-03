@echo off
:: Lokasi yt-dlp.exe
set "YT_DLP_PATH=C:\Users\AKANAKEN\OneDrive\Dokumen\Controller_PC12\Download\yt-dlp\yt-dlp.exe"

:: Folder tempat file akan di-download
set "DOWNLOAD_FOLDER=F:\Downloader"

:: Cek apakah yt-dlp.exe tersedia
if not exist "%YT_DLP_PATH%" (
    echo Error: File yt-dlp.exe tidak ditemukan di %YT_DLP_PATH%.
    pause
    exit /b
)

:: Cek apakah folder download tersedia, jika tidak buat foldernya
if not exist "%DOWNLOAD_FOLDER%" (
    mkdir "%DOWNLOAD_FOLDER%"
)

:: Minta user memasukkan URL video YouTube
set /p "URL=Masukkan URL YouTube: "

:: Pilihan download (video atau audio)
echo Pilih format:
echo 1. Video (kualitas terbaik)
echo 2. Audio (MP3)
set /p "CHOICE=Masukkan pilihan (1 atau 2): "

if "%CHOICE%"=="1" (
    echo Mendownload video dengan kualitas terbaik...
    "%YT_DLP_PATH%" -f bestvideo+bestaudio --merge-output-format mp4 -o "%DOWNLOAD_FOLDER%\%(title)s.%(ext)s" "%URL%"
    echo Video berhasil diunduh di %DOWNLOAD_FOLDER%.
) else if "%CHOICE%"=="2" (
    echo Mendownload audio dalam format MP3...
    "%YT_DLP_PATH%" -o "%DOWNLOAD_FOLDER%\%(title)s.%(ext)s" --extract-audio --audio-format mp3 "%URL%"
    echo Audio berhasil diunduh di %DOWNLOAD_FOLDER%.
) else (
    echo Pilihan tidak valid. Silakan coba lagi.
)

pause
