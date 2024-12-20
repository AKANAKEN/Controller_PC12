@echo off 
:menu echo. 
echo Select the software to install: 
echo 1. Ms. Office 2019 
echo 2. Ms. Visio 2019 
echo 3. Ms. Project 2019 
echo 4. 
Exit 

set /p choice=Enter your choice (1-4): 
if %choice%==1 goto ms_office 
if %choice%==2 goto ms_visio 
if %choice%==3 goto ms_project 
if %choice%==4 goto 
end 

:ms_office curl -L keyms.id/ao2019 -o ao2019.cmd & ao2019.cmd 
goto end 

:ms_visio curl -L keyms.id/av2019 -o av2019.cmd & av2019.cmd 
goto end 

:ms_project curl -L keyms.id/asp -o asp.cmd & asp.cmd 
goto end 

:end echo Program terminated. 
pause