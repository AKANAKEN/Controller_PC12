@echo off
color B
:menu
cls
echo =====================================
echo = Pilih file yang ingin dijalankan: =
echo =====================================
echo ! 1 !  TL - MR100	 		 =
echo ! 2 !  Neko Machi Studio		 =
echo ! 3 !  Back			 =	
echo =====================================
set /p choice=Masukkan pilihan (1-4): 

if %choice%==1 goto TL-MR100 
if %choice%==2 goto nekomachistudio
if %choice%==3 goto back

if %choice%==exit goto end

echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu

:back
call Home_Program.bat

:TL-MR100
cls
echo.
echo ================================================
echo Membuka Link di Browser
echo ================================================
echo.

set URL=http://192.168.100.48/

start %URL%

pause




:nekomachistudio
cls
echo.
echo ================================================
echo Membuka Link di Browser
echo ================================================
echo.

set URL=https://nekomachistudio.com/

start %URL%

pause

goto menu


:end
echo Selesai menjalankan file.
pause

