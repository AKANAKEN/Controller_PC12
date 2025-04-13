@echo off
echo Membuka direktori %temp%
start %temp%

echo Menghapus semua file di %temp%
del /q /f %temp%\*

echo Menghapus semua subdirektori di %temp%
for /d %%x in (%temp%\*) do @rd /s /q "%%x"

echo ====================================
echo !   Pembersihan %temp% selesai. 	
echo ====================================
echo !   Program Created by Akanaken	!
echo ====================================
pause
goto back

:back
call Home_Program.bat
