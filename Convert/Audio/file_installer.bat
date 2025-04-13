@echo off
echo =========================================
echo Download and Setup Vosk Model
echo =========================================

REM Pilih bahasa
set /p lang="Pilih bahasa model (en/id): "

if /i "%lang%"=="en" (
    set url=https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip
    set model_name=vosk-model-small-en-us-0.15
) else if /i "%lang%"=="id" (
    set url=https://alphacephei.com/vosk/models/vosk-model-small-id-0.22.zip
    set model_name=vosk-model-small-id-0.22
) else (
    echo Bahasa tidak valid. Pilih "en" untuk Bahasa Inggris atau "id" untuk Bahasa Indonesia.
    pause
    exit /b
)

echo =========================================
echo Mengunduh model dari: %url%
echo =========================================

REM Unduh model menggunakan curl
curl -L -o %model_name%.zip %url%

if %errorlevel% neq 0 (
    echo Gagal mengunduh model. Periksa koneksi internet Anda.
    pause
    exit /b
)

echo =========================================
echo Ekstraksi model: %model_name%.zip
echo =========================================

REM Ekstrak file ZIP
powershell -Command "Expand-Archive -Path '%model_name%.zip' -DestinationPath 'model'"

if %errorlevel% neq 0 (
    echo Gagal mengekstrak file ZIP. Pastikan Anda memiliki PowerShell.
    pause
    exit /b
)

REM Hapus file ZIP setelah ekstraksi
del %model_name%.zip

echo =========================================
echo Model berhasil diunduh dan diekstrak!
echo Model tersedia di folder: model
echo =========================================

pause
