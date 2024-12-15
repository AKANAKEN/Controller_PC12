@echo off
echo Installing PyMuPDF...
pip install Pillow reportlab

if %errorlevel% neq 0 (
    echo Failed to install PyMuPDF. Please check your Python and pip installation.
    pause
    exit /b
)

echo Running your Python script...
python convrt.py
pause