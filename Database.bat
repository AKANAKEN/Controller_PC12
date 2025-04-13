@echo off
setlocal enabledelayedexpansion

:: File data yang digunakan sebagai "database"
set datafile=data.txt

:menu
cls
echo ================================================
echo        Sistem Manajemen User Sederhana
echo ================================================
echo 1. Tampilkan Semua User
echo 2. Tambah User
echo 3. Ubah User
echo 4. Hapus User
echo 5. Keluar
echo ================================================
set /p choice=Pilih opsi [1-5]: 

if "%choice%"=="1" goto display_data
if "%choice%"=="2" goto add_data
if "%choice%"=="3" goto modify_data
if "%choice%"=="4" goto delete_data
if "%choice%"=="5" goto exit

:display_data
cls
echo ================================================
echo                Daftar User
echo ================================================
if not exist %datafile% echo (Tidak ada data yang tersedia) && pause && goto menu
for /f "tokens=1,2 delims=:" %%a in (%datafile%) do (
    echo Username: %%a
)
echo.
pause
goto menu

:add_data
cls
echo ================================================
echo                  Tambah User
echo ================================================
set /p username=Masukkan username: 
set /p password=Masukkan password: 
echo %username%:%password%>>%datafile%
echo User berhasil ditambahkan!
pause
goto menu

:modify_data
cls
echo ================================================
echo                  Ubah User
echo ================================================
if not exist %datafile% echo (Tidak ada data yang tersedia) && pause && goto menu
type %datafile%
echo.
set /p oldusername=Masukkan username yang ingin diubah: 
findstr "^%oldusername%:" %datafile% >nul
if %errorlevel% neq 0 (
    echo User tidak ditemukan!
    pause
    goto menu
)
set /p newusername=Masukkan username baru: 
set /p newpassword=Masukkan password baru: 
(for /f "tokens=1,* delims=:" %%a in (%datafile%) do (
    if "%%a"=="%oldusername%" (
        echo %newusername%:%newpassword%>>tempfile.txt
    ) else (
        echo %%a:%%b>>tempfile.txt
    )
))
move /y tempfile.txt %datafile%
echo User berhasil diubah!
pause
goto menu

:delete_data
cls
echo ================================================
echo                  Hapus User
echo ================================================
if not exist %datafile% echo (Tidak ada data yang tersedia) && pause && goto menu
type %datafile%
echo.
set /p delusername=Masukkan username yang ingin dihapus: 
findstr "^%delusername%:" %datafile% >nul
if %errorlevel% neq 0 (
    echo User tidak ditemukan!
    pause
    goto menu
)
(for /f "tokens=1,* delims=:" %%a in (%datafile%) do (
    if not "%%a"=="%delusername%" echo %%a:%%b>>tempfile.txt
))
move /y tempfile.txt %datafile%
echo User berhasil dihapus!
pause
goto menu

:exit
endlocal
exit
