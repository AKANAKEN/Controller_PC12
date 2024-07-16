@echo off
color b
rem Menampilkan daftar semua profil Wi-Fi
netsh wlan show profiles
echo.
rem Meminta pengguna untuk memasukkan nama profil Wi-Fi
set /p name="Masukkan nama profil Wi-Fi yang ingin dilihat detailnya: "
echo.
rem Menampilkan detail profil Wi-Fi yang dipilih
netsh wlan show profiles name="%name%" key=clear
pause

call Program.bat
goto end