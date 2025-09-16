$WshShell = New-Object -ComObject WScript.Shell

# Full path to the project folder
$projectPath = (Get-Item -Path ".").FullName

# Create a shortcut for the batch script
$shortcutBat = $WshShell.CreateShortcut("$projectPath\WatermarkRemover-AI Environment (CMD).lnk")
$shortcutBat.TargetPath = "cmd.exe"
$shortcutBat.Arguments = "/k `"$projectPath\activate_env.bat`""
$shortcutBat.WorkingDirectory = $projectPath
$shortcutBat.IconLocation = "C:\Windows\System32\cmd.exe,0"
$shortcutBat.Description = "Open the Conda environment for WatermarkRemover-AI (CMD)"
$shortcutBat.Save()

# Create a shortcut for the PowerShell script
$shortcutPs = $WshShell.CreateShortcut("$projectPath\WatermarkRemover-AI Environment (PowerShell).lnk")
$shortcutPs.TargetPath = "powershell.exe"
$shortcutPs.Arguments = "-NoExit -ExecutionPolicy Bypass -File `"$projectPath\activate_env.ps1`""
$shortcutPs.WorkingDirectory = $projectPath
$shortcutPs.IconLocation = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe,0"
$shortcutPs.Description = "Open the Conda environment for WatermarkRemover-AI (PowerShell)"
$shortcutPs.Save()

# Create a direct shortcut for the GUI application
$shortcutGui = $WshShell.CreateShortcut("$projectPath\WatermarkRemover-AI (GUI).lnk")
$shortcutGui.TargetPath = "cmd.exe"
$shortcutGui.Arguments = "/k `"conda activate py312aiwatermark && python $projectPath\remwmgui.py`""
$shortcutGui.WorkingDirectory = $projectPath
$shortcutGui.Description = "Launch the WatermarkRemover-AI graphical interface"
$shortcutGui.Save()

Write-Host "Shortcuts created successfully in $projectPath" -ForegroundColor Green
Write-Host "You can move them to your desktop or to the Start menu." -ForegroundColor Yellow
