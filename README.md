# WatermarkRemover-AI

**AI-powered watermark removal tool built with the Florence-2 and LaMa models**

![Watermark removal example](https://raw.githubusercontent.com/D-Ogi/WatermarkRemover-AI/main/docs/images/demo.jpg)

## Overview

`WatermarkRemover-AI` is a modern application that relies on AI models to detect and remove watermarks with precision. It uses Microsoft's Florence-2 model to locate watermarks and LaMa to naturally inpaint the removed regions. The software exposes both a command-line interface (CLI) and a PyQt6-based graphical user interface (GUI), making it approachable for new users and power users alike.

## Features

* **Multiple modes** – Process single files or entire directories of images and videos.
* **Advanced watermark detection** – Uses Florence-2 open-vocabulary detection for accurate identification.
* **Seamless inpainting** – Employs LaMa for high-quality, context-aware filling of masked areas.
* **Video support** – Processes video files frame by frame to remove watermarks.
* **Customizable output** –
  * Configure the maximum bounding-box size for watermark detection.
  * Control transparency for watermark regions (images only).
  * Force specific output formats (PNG, WEBP, JPG for images; MP4, AVI for videos).
* **Progress tracking** – Real-time progress updates in both GUI and CLI modes.
* **Dark mode support** – The GUI automatically adapts to the operating system theme.
* **Efficient resource usage** – Optimized for GPU acceleration with CUDA (optional).

## Quick Installation

Check the [QUICK_START.md](./QUICK_START.md) file for a fast installation and setup guide.

For a detailed walkthrough, read [INSTALLATION_GUIDE.md](./INSTALLATION_GUIDE.md).

### Requirements

* Conda/Miniconda installed.
* CUDA (optional for GPU acceleration; the application also runs well on CPU).

### One-click installation

Run the PowerShell installation script:

```powershell
powershell -ExecutionPolicy Bypass -File install_windows.ps1
```

This script installs every dependency and downloads the required LaMa model automatically.

## Usage

### Using the graphical user interface (GUI)

1. **Launch the application**:
   ```
   conda activate py312aiwatermark
   python remwmgui.py
   ```
2. **Configure the settings**:
   * **Mode** – Choose "Process Single File" or "Process Directory".
   * **Paths** – Browse for input and output locations.
   * **Options** –
     * Enable overwriting existing files.
     * Enable transparency for watermark regions (images only).
     * Adjust the maximum bounding-box size.
   * **Output format** – Choose between PNG, WEBP, JPG for images, MP4, AVI for videos, or keep the original format.
3. **Start processing**:
   * Click "Start" to begin.
   * Monitor progress updates and logs directly in the interface.

### Command-line usage (CLI)

1. **Basic command**:
   ```
   python remwm.py input_path output_path
   ```
2. **Options**:
   * `--overwrite` – Overwrite existing files.
   * `--transparent` – Make watermark regions transparent (images only).
   * `--max-bbox-percent` – Maximum bounding-box size in percent (default: 10%).
   * `--force-format` – Force the output format (PNG, WEBP, JPG for images; MP4, AVI for videos).
3. **Examples**:
   ```
   python remwm.py ./input_images ./output_images --overwrite --max-bbox-percent=15 --force-format=PNG
   ```
   ```
   python remwm.py ./input_video.mp4 ./output_video.mp4 --max-bbox-percent=15 --force-format=MP4
   ```

## Upgrade Notes

If you already used an older version of the repository, follow these steps to upgrade:

1. **Update the repository**:
   ```
   git pull
   ```
2. **Remove the previous environment**:
   ```
   conda deactivate
   conda env remove -n py312
   ```
3. **Run the installation script**:
   ```
   powershell -ExecutionPolicy Bypass -File install_windows.ps1
   ```

## Common Issues

Consult [INSTALLATION_GUIDE.md](./INSTALLATION_GUIDE.md) for solutions to frequent problems.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
