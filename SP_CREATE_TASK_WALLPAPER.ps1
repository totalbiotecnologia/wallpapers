#-------------------------------------------------------------------#
# ScriptName : SP_CREATE_TASK_WALLPAPER.ps1                         #
# Description : Force a Desktop wallpaper Refresh                   #
# Credits  : Márcio Luiz de Oliveira                                #
#                                                                   #
# Date : 28 April 2023                                              #
#-------------------------------------------------------------------#

wget -o "c:\windows\temp\sp_set_wallpaper.ps1" https://github.com/totalbiotecnologia/wallpapers/raw/main/sp_set_wallpaper.ps1

sleep 5

$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument C:\windows\temp\sp_set_wallpaper.ps1

sleep 2

$trigger = New-ScheduledTaskTrigger -Daily -At 10am

sleep 2

Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath "TI-Tasks" -TaskName "AtribuiWallpaper" -Description "Atribui Wallpaper na estação de trabalho"