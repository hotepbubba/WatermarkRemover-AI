# WatermarkRemover-AI Installation Guide for Windows

This guide explains how to install and configure WatermarkRemover-AI on Windows.

## Prerequisites

1. **Python and Conda** – Install Miniconda or Anaconda on your machine. If needed, download Miniconda from the [official site](https://docs.conda.io/en/latest/miniconda.html).
2. **Git** – Required if you want to clone the repository directly. Download it from [git-scm.com](https://git-scm.com/downloads).

## Method 1: Use the automatic installation script

1. Open a command prompt (CMD) in the project directory.
2. Run the installation script:
   ```
   install_windows.bat
   ```
3. Follow the on-screen instructions.

## Method 2: Manual installation

If the automatic script does not work, follow these manual steps:

1. **Open Command Prompt or PowerShell** with administrator rights.
2. **Navigate to the project directory**:
   ```
   cd path\to\WatermarkRemover-AI
   ```
3. **Create the Conda environment**:
   ```
   conda env create -f environment.yml
   ```
4. **Activate the environment**:
   ```
   conda activate py312aiwatermark
   ```
5. **Install the additional dependencies**:
   ```
   pip install PyQt6 transformers iopaint opencv-python-headless
   ```
6. **Download the LaMa model**:
   ```
   iopaint download --model lama
   ```

## Launching the application

After installation, you can start the application:

1. **Activate the environment** (if it is not already active):
   ```
   conda activate py312aiwatermark
   ```
2. **Launch the GUI**:
   ```
   python remwmgui.py
   ```

## Usage

Once the application is running:

1. **Choose the processing mode**:
   - Single image processing
   - Full directory processing
2. **Select the input and output paths**.
3. **Configure options**:
   - Enable overwriting existing files if required.
   - Decide whether watermark regions should be transparent.
   - Adjust the maximum bounding-box size for detection.
   - Choose the output format (PNG, WEBP, JPG, or original).
4. **Click "Start" to begin processing**.

## Common issues and solutions

### Issue: "Conda is not recognized as an internal or external command"
**Solution** – Ensure that Conda is properly installed and that its path is added to the PATH environment variable.

### Issue: Dependency installation fails
**Solution** – Run the installation commands individually and review the specific error messages.

### Issue: The application does not start
**Solution** – Confirm that the Python environment is active with `conda activate py312aiwatermark`.

### Issue: The LaMa model fails to download
**Solution** – Check your internet connection and retry with `iopaint download --model lama`.

## Support

If you experience issues, you can:
- Open an issue on the [GitHub repository](https://github.com/D-Ogi/WatermarkRemover-AI).
- Review existing discussions to see if the problem has already been reported.

---

Enjoy your new AI-powered watermark removal tool!
