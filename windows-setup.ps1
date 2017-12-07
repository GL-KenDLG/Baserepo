# Script to install a few basic programs in Windows

@ECHO.

$client = New-Object "System.Net.WebClient"

@Echo Installing Chrome
$client.DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', 'c:/temp/chrome.exe')
c:/temp/chrome.exe /silent /install;

@Echo Installing Firefox
$client.DownloadFile('https://download-installer.cdn.mozilla.net/pub/firefox/releases/57.0.1/win64/en-US/Firefox%20Setup%2057.0.1.exe', 'c:/temp/firefox.exe')
@start /wait "c:/temp/firefox.exe" -ms


@Echo Installing Notepad plus plus
$client.DownloadFile('https://notepad-plus-plus.org/repository/7.x/7.3.3/npp.7.3.3.Installer.exe', 'c:/temp/notepadplusplus.exe')
c:/notepadplusplus.exe /S


@Echo Installing Slack
$client.DownloadFile('https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/SlackSetup.msi', 'c:/temp/SlackSetup.msi')
msiexec /i c:/temp/SlackSetup.msi /quiet /qn /norestart

#Cleaning up
rm c:/temp -rec


