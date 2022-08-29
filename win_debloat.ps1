#powershell script that debloats windows using windows10debloater

#github url to download zip file
#Assign zip file url to local variable
$Url = "https://github.com/Sycnex/Windows10Debloater/archive/refs/heads/master.zip"
$DownloadZipFile = "%temp%\" + $(Split-Path -Path $Url -Leaf)
$DebloatFolder = "C:\"
Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile
$ExtractShell = New-Object -ComObject Shell.Application 
$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 
$ExtractShell.NameSpace($DebloatFolder).CopyHere($ExtractFiles) 
Start-Process $DebloatFolder


#execute debloater
Set-Location "C:\Windows10Debloater-master"
&.\Windows10SysPrepDebloater.ps1 -Sysprep -Debloat -Privacy
