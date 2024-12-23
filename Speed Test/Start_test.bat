@echo off
echo Pilih opsi:
echo 1. Instal pustaka Python (speedtest-cli dan ping3)
echo 2. Jalankan skrip tes kecepatan internet
set /p choice=Masukkan pilihan (1 atau 2): 

if %choice%==1 (
    echo Menginstal pustaka Python...
    pip install speedtest-cli ping3
    pip install --upgrade speedtest-cli
    pip install tabulate
    echo Instalasi selesai!
) else if %choice%==2 (
    echo Menjalankan skrip tes kecepatan internet...
    python Speed-test.py
) else (
    echo Pilihan tidak valid, silakan jalankan skrip lagi dan pilih opsi yang benar.
)

pause
