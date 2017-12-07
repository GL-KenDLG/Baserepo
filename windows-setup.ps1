# Script to install a few basic programs in Windows

Write-Host "Creating temporary directory \temp"
$fso = new-object -ComObject scripting.filesystemobject
$fso.CreateFolder("$Home\Desktop\temp")

Write-Host "Starting Windows Setup"
$client = New-Object "System.Net.WebClient"

Write-Host "Installing Chrome"
$client.DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', '$Home\Desktop\temp\chrome.exe')
$Home\Desktop\temp\chrome.exe /silent /install;

Write-Host "Installing Firefox"
$client.DownloadFile('https://download-installer.cdn.mozilla.net/pub/firefox/releases/57.0.1/win64/en-US/Firefox%20Setup%2057.0.1.exe', '$Home\Desktop\temp\firefox.exe')
@ECHO. @ECHO Installing Firefox @start /wait "$Home\Desktop\temp\firefox.exe" -ms


Write-Host "Installing Notepad++"
$client.DownloadFile('https://notepad-plus-plus.org/repository/7.x/7.3.3/npp.7.3.3.Installer.exe', '$Home\Desktop\temp\notepadplusplus.exe')
$Home\Desktop\temp\notepadplusplus.exe /S


Write-Host "Installing Slack"
$client.DownloadFile('https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/SlackSetup.msi', '$Home\Desktop\temp\SlackSetup.msi')
msiexec /i $Home\Desktop\temp\SlackSetup.msi /quiet /qn /norestart

Write-Host "Cleaning up"
rm $Home\Desktop\temp -rec


