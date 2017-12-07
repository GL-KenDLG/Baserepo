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


#Cleaning up
rm c:/temp -rec
