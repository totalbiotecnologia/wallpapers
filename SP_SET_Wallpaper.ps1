#-------------------------------------------------------------------#
# ScriptName : SP_SET_Wallpaper.ps1                                 #
# Description : Force a Desktop wallpaper Refresh                   #
# Credits  : Unknown (if you know original creator, let us know)    #
#                                                                   #
# Date : 28 April 2023                                              #
#-------------------------------------------------------------------#

#Modify Path to the picture accordingly to reflect your infrastructure

wget -o "c:\windows\temp\wallpaper.jpg" https://github.com/totalbiotecnologia/wallpapers/raw/main/Wallpaper.jpg

sleep 5

Set-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name WallpaperStyle -Value 2

sleep 5

$imgPath="c:\windows\temp\wallpaper.jpg"
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 

#Apply the Change on the system 
[Win32.Wallpaper]::SetWallpaper($imgPath)