@echo off
echo Menampilkan informasi lisensi Microsoft Office...
cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
cscript ospp.vbs /dstatus
pause
