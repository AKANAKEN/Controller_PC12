@echo off
:: Menghapus file di folder Temp
echo Menghapus file di folder Temp...
del /f /s /q %temp%\*
rd /s /q %temp%

:: Menghapus file di folder %temp% (untuk user lain)
echo Menghapus file di folder TEMP...
del /f /s /q C:\Windows\Temp\*
rd /s /q C:\Windows\Temp\

:: Menampilkan pesan selesai
echo Pembersihan selesai.
pause
