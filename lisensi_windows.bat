@echo off
echo Memeriksa status lisensi Windows...
slmgr /xpr
slmgr /dli
slmgr /dlv
pause
