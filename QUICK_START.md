# WatermarkRemover-AI - Quick Start Guide

## Rapid installation on Windows

1. **Prerequisite** – Install [Miniconda](https://docs.conda.io/en/latest/miniconda.html) if it is not already available on your system.
2. **Install the application**:
   - Open PowerShell as an administrator.
   - Navigate to the project folder.
   - Run the following command:
     ```
     powershell -ExecutionPolicy Bypass -File install_windows.ps1
     ```
3. **Manual alternative**:
   ```powershell
   # Create the Conda environment
   conda env create -f environment.yml

   # Activate the environment
   conda activate py312aiwatermark

   # Install the additional dependencies
   pip install PyQt6 transformers iopaint opencv-python-headless

   # Download the LaMa model
   iopaint download --model lama
   ```

## Launching the application

1. Open PowerShell.
2. Activate the environment: `conda activate py312aiwatermark`
3. Start the application: `python remwmgui.py`

## Basic usage

1. **Mode** – Choose whether to process a single image or an entire directory.
2. **Paths** – Select input and output locations.
3. **Options** –
   - **Overwrite Existing Files** – Replace files that already exist.
   - **Make Watermark Transparent** – Leave watermark areas transparent.
   - **Max BBox Percent** – Maximum watermark area (as a percentage of the image).
   - **Force Format** – PNG, WEBP, JPG, or keep the original.
4. **Start** – Begin processing.

## Usage tips

- For best results, prefer PNG output because it supports transparency.
- For large images, choose a lower Max BBox Percent value.
- Transparency is especially useful when you want to preserve fine image details.

## Troubleshooting

- Verify that every prerequisite is installed correctly.
- Ensure the Conda environment is active.
- Refer to `INSTALLATION_GUIDE.md` for more detailed instructions.
