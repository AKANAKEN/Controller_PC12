@echo off
setlocal enabledelayedexpansion

rem Define database file
set DB_FILE=database_bat.sql

rem Check if sqlite3 is installed
where sqlite3 >nul 2>nul
if %errorlevel% neq 0 (
    echo sqlite3 is required but not installed.
    echo Please install sqlite3 and try again.
    exit /b
)

rem Function to login
:login
cls
echo === User Login ===
set /p userInput=Username:
set /p passInput=Password:

rem Verify user credentials
for /f "tokens=*" %%i in ('sqlite3 %DB_FILE% "SELECT COUNT(*) FROM users WHERE username='%userInput%' AND password='%passInput%';"') do set validUser=%%i
if "!validUser!"=="1" (
    echo Login successful!
    goto menu
) else (
    echo Invalid credentials. Please try again.
    pause
    goto login
)

rem Main menu
:menu
cls
echo === Main Menu ===
echo 1. Add Account
echo 2. View Accounts
echo 3. Search Accounts
echo 4. Update Account
echo 5. Delete Account
echo 6. Exit
set /p choice=Choose an option:

if "%choice%"=="1" goto add_account
if "%choice%"=="2" goto view_accounts
if "%choice%"=="3" goto search_accounts
if "%choice%"=="4" goto update_account
if "%choice%"=="5" goto delete_account
if "%choice%"=="6" exit

goto menu

:add_account
cls
echo === Add New Account ===
set /p platformInput=Platform:
set /p usernameInput=Username:
set /p passwordInput=Password:

sqlite3 %DB_FILE% "INSERT INTO accounts (platform, username, password) VALUES ('%platformInput%', '%usernameInput%', '%passwordInput%');"

echo Account added successfully!
pause
goto menu

:view_accounts
cls
echo === View All Accounts ===
sqlite3 %DB_FILE% "SELECT id, platform, username FROM accounts;"
pause
goto menu

:search_accounts
cls
echo === Search Accounts ===
set /p searchInput=Enter platform or username to search:
sqlite3 %DB_FILE% "SELECT id, platform, username, password FROM accounts WHERE platform LIKE '%%%searchInput%%%' OR username LIKE '%%%searchInput%%%';"
pause
goto menu

:update_account
cls
echo === Update Account ===
set /p idInput=Enter the ID of the account to update:
set /p newPlatformInput=New Platform:
set /p newUsernameInput=New Username:
set /p newPasswordInput=New Password:

sqlite3 %DB_FILE% "UPDATE accounts SET platform='%newPlatformInput%', username='%newUsernameInput%', password='%newPasswordInput%' WHERE id=%idInput%;"

echo Account updated successfully!
pause
goto menu

:delete_account
cls
echo === Delete Account ===
set /p idInput=Enter the ID of the account to delete:

sqlite3 %DB_FILE% "DELETE FROM accounts WHERE id=%idInput%;"

echo Account deleted successfully!
pause
goto menu

exit
