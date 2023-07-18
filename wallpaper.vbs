command = "powershell.exe -nologo -executionpolicy bypass -w hidden -NonInteractive -NoLogo -NoProfile -command c:\BioLogon\SP_SET_Wallpaper_POWERSHELL.ps1"
 set shell = CreateObject("WScript.Shell")
 shell.Run command,0