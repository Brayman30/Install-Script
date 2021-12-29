##Display A Diologue
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show('Make sure You have access to Admin, as this script will ask for Admin access later on.','Admin Check','OkCancel','Info')

## Make sure any lines that need to be run as Admin are run as Admin.
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

## Declare Some Variables that will be used throughout the entire script##
##########################################################################

$Cdesktop = [Environment]::GetFolderPath("CommonDesktopDirectory")


$url = "http://www.contoso.com/pathtoexe.exe"
$outpath = $Cdesktop
# Since we aren't running this one we don't need any args, but if we did: $args = @("Comma","Separated","Arguments")
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $outpath)
# This file dosen't need to be installed (Which is why it got put on the Desktop) but if it did:
# Start-Process -Filepath "$PSScriptRoot/myexe.exe" -ArgumentList $args
