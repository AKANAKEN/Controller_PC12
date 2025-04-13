@echo off
echo Checking and installing dependencies...
pip install speechrecognition
pip install pydub
pip install speechrecognition pydub
pip install vosk
pip install soundfile
pip install torch torchaudio transformers



if %errorlevel% neq 0 (
    echo Failed to install dependencies. Please check your Python installation or pip.
    pause
    exit /b
)

echo Dependencies installed successfully.
echo ------------------------------

echo Running the audio-to-text program...
python transcribe_audio.py

if %errorlevel% neq 0 (
    echo Failed to run the Python script. Please check for errors.
    pause
    exit /b
)

echo Program executed successfully.
pause
