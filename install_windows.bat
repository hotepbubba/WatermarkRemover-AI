@echo off
echo ==================================
echo  Installing WatermarkRemover-AI
echo ==================================
echo.

REM Check whether Conda is installed
where conda >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Conda is not installed or not available in the PATH.
    echo Please install Miniconda or Anaconda before continuing.
    echo Download it from: https://docs.conda.io/en/latest/miniconda.html
    pause
    exit /b 1
)

echo Conda detected. Checking the environment...
echo.

REM Check whether the environment already exists
conda env list | findstr /C:"py312aiwatermark" >nul
if %ERRORLEVEL% EQU 0 (
    echo The py312aiwatermark environment already exists.
    choice /C YN /M "Do you want to recreate it? (Y/N)"
    if %ERRORLEVEL% EQU 1 (
        echo Removing the previous environment...
        call conda env remove -n py312aiwatermark
    ) else (
        echo Activating the existing environment...
        goto ACTIVATION
    )
)

echo Creating the Conda environment from environment.yml...
call conda env create -f environment.yml
if %ERRORLEVEL% NEQ 0 (
    echo Failed to create the environment.
    pause
    exit /b 1
)

:ACTIVATION
echo Activating the py312aiwatermark environment...
call conda activate py312aiwatermark
if %ERRORLEVEL% NEQ 0 (
    echo Failed to activate the environment.
    pause
    exit /b 1
)

echo Installing additional dependencies...
pip install PyQt6 transformers iopaint opencv-python-headless
if %ERRORLEVEL% NEQ 0 (
    echo Failed to install the additional dependencies.
    pause
    exit /b 1
)

echo Downloading the LaMa model...
iopaint download --model lama
if %ERRORLEVEL% NEQ 0 (
    echo Warning: An error occurred while downloading the LaMa model.
    echo You can try again later with: iopaint download --model lama
)

echo.
echo ===============================
echo  Installation complete!
echo ===============================
echo.
echo To launch the application:
echo 1. Open a command prompt
echo 2. Activate the environment: conda activate py312aiwatermark
echo 3. Start the application: python remwmgui.py
echo.

choice /C YN /M "Do you want to launch the application now? (Y/N)"
if %ERRORLEVEL% EQU 1 (
    echo Starting the application...
    python remwmgui.py
)

echo.
pause
