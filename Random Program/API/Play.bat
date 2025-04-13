@echo off
echo Pilih opsi:
echo 1. Install required Python packages (Flask, gspread, oauth2client)
echo 2. Run the Flask application
echo 3. Generate API Token and URL

set /p choice=Enter your choice (1, 2, or 3):

if "%choice%"=="1" (
    echo Installing required Python packages...
   pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

) else if "%choice%"=="2" (
    set /p url=Enter Google Spreadsheet URL:
    echo Starting the Flask application with provided URL...
    start "" "http://127.0.0.1:5000/api/data?url=%url%"
    python API.py
) else if "%choice%"=="3" (
    set /p url=Enter Google Spreadsheet URL:
    echo Starting the Flask application...
    start python API.py
    timeout /t 5 > nul
    echo Generating API Token and URL...
    curl -X POST -H "Content-Type: application/json" -d "{\"url\":\"%url%\"}" http://127.0.0.1:5000/api/generate
) else (
    echo Invalid choice. Please run the batch file again and select either 1, 2, or 3.
)

pause
