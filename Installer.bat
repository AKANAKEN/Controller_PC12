@echo off
color B
:menu
cls
echo =============================
echo Pilih file yang ingin dijalankan:
echo =============================
echo 1. Install
echo 2. Check
echo =============================
set /p choice=Masukkan pilihan (1-4/tmp): 

if %choice%==1 goto file1
if %choice%==2 goto file2

if %choice%==exit goto end

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu

:file1
pip install psutil py-cpuinfo
pip install GPUtil

rem Memeriksa dan menginstal psutil echo Menginstal psutil... 
pip install psutil 
echo. 

rem Memeriksa dan menginstal GPUtil 
echo Menginstal GPUtil... 
pip install gputil echo. 

rem Memeriksa dan menginstal tabulate 
echo Menginstal tabulate... 
pip install tabulate echo.


:file2
color A
echo ====================================================
echo =       Memeriksa dan Menambahkan WMIC ke PATH       =
echo ====================================================
echo.

rem Memeriksa apakah wmic tersedia di system32\wbem
if exist C:\Windows\System32\wbem\wmic.exe (
    echo WMIC ditemukan di C:\Windows\System32\wbem\
    echo Menambahkan WMIC ke PATH...
    
    rem Menambahkan path wmic ke PATH sistem
    setx PATH "%PATH%;C:\Windows\System32\wbem"
    
    echo WMIC berhasil ditambahkan ke PATH.
) else (
    echo WMIC tidak ditemukan. Silakan pastikan wmic terinstal di sistem Anda.
)

echo Proses selesai!
pause


:end
echo Selesai menjalankan file.
exit
pause