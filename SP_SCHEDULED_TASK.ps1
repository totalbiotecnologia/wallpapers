

$FolderName = "c:\temp\"


if (Test-Path $FolderName) {
  
	wget -o "c:\temp\SP_SET_Wallpaper_POWERSHELL.ps1" https://github.com/totalbiotecnologia/wallpapers/raw/main/SP_SET_Wallpaper_POWERSHELL.ps1

}
else
{
	New-Item $FolderName -ItemType Directory
	wget -o "c:\temp\SP_SET_Wallpaper_POWERSHELL.ps1" https://github.com/totalbiotecnologia/wallpapers/raw/main/SP_SET_Wallpaper_POWERSHELL.ps1
}

sleep 5

$username = Get-WMIObject -class Win32_ComputerSystem | select username

# Create a new task action
$taskAction = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NonInteractive -NoLogo -NoProfile -File "C:\temp\SP_SET_Wallpaper_POWERSHELL.ps1"'

# Create a new trigger (Daily at 310 AM)
$taskTrigger = New-ScheduledTaskTrigger -Daily -At 10AM

# Register the new PowerShell scheduled task

# The name of your scheduled task.
$taskName = "SET_Wallpaper"

# Describe the scheduled task.
$description = "Aplica papel de parede na estação de trabalho."

# Set the task principal's user ID and run level.
$taskPrincipal = New-ScheduledTaskPrincipal -UserId $username -RunLevel Highest

# Set the task compatibility value to Windows 10.
$taskSettings = New-ScheduledTaskSettingsSet -Compatibility Win8

# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $taskTrigger -TaskPath "IT Bio" -Description $description

#sleep 5

# Update the task principal settings
#Set-ScheduledTask -TaskName $taskName -Principal $taskPrincipal -Settings $taskSettings