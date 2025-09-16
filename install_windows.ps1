# PowerShell installation script for WatermarkRemover-AI
Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  Installing WatermarkRemover-AI" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Check for Conda
try {
    $condaVersion = conda --version
    Write-Host "Conda detected: $condaVersion" -ForegroundColor Green
}
catch {
    Write-Host "Conda is not installed or not available in the PATH." -ForegroundColor Red
    Write-Host "Please install Miniconda or Anaconda before continuing." -ForegroundColor Red
    Write-Host "Download it from: https://docs.conda.io/en/latest/miniconda.html" -ForegroundColor Yellow
    Read-Host -Prompt "Press Enter to exit"
    exit 1
}

Write-Host "Checking the environment..."

# Determine whether the environment exists
$envExists = conda env list | Select-String "py312aiwatermark"
if ($envExists) {
    Write-Host "The py312aiwatermark environment already exists." -ForegroundColor Yellow
    $recreate = Read-Host "Do you want to recreate it? (y/n)"
    if ($recreate -eq "y" -or $recreate -eq "Y") {
        Write-Host "Removing the previous environment..." -ForegroundColor Yellow
        conda env remove -n py312aiwatermark
    }
    else {
        Write-Host "Activating the existing environment..." -ForegroundColor Green
        $activateEnv = $true
    }
}

if (-not $activateEnv) {
    Write-Host "Creating the Conda environment from environment.yml..." -ForegroundColor Cyan
    conda env create -f environment.yml
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to create the environment." -ForegroundColor Red
        Read-Host -Prompt "Press Enter to exit"
        exit 1
    }
}

Write-Host "Activating the py312aiwatermark environment..." -ForegroundColor Cyan
# PowerShell requires a different approach to activate the environment within the script
$condaPath = (Get-Command conda).Source
$condaExe = Split-Path -Parent $condaPath
$activateScript = Join-Path $condaExe "..\..\shell\condabin\conda-hook.ps1"
. $activateScript
conda activate py312aiwatermark

Write-Host "Installing additional dependencies..." -ForegroundColor Cyan
pip install PyQt6 transformers iopaint opencv-python-headless
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to install the additional dependencies." -ForegroundColor Red
    Read-Host -Prompt "Press Enter to exit"
    exit 1
}

Write-Host "Downloading the LaMa model..." -ForegroundColor Cyan
iopaint download --model lama
if ($LASTEXITCODE -ne 0) {
    Write-Host "Warning: An error occurred while downloading the LaMa model." -ForegroundColor Yellow
    Write-Host "You can try again later with: iopaint download --model lama" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "===============================" -ForegroundColor Green
Write-Host "  Installation complete!" -ForegroundColor Green
Write-Host "===============================" -ForegroundColor Green
Write-Host ""
Write-Host "To launch the application:" -ForegroundColor Cyan
Write-Host "1. Open a PowerShell window" -ForegroundColor Cyan
Write-Host "2. Activate the environment: conda activate py312aiwatermark" -ForegroundColor Cyan
Write-Host "3. Start the application: python remwmgui.py" -ForegroundColor Cyan
Write-Host ""

$launch = Read-Host "Do you want to launch the application now? (y/n)"
if ($launch -eq "y" -or $launch -eq "Y") {
    Write-Host "Starting the application..." -ForegroundColor Green
    python remwmgui.py
}

Write-Host ""
Read-Host -Prompt "Press Enter to exit"
