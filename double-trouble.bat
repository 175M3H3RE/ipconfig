@echo off & title Ikea Network Switcher
set /a counter=-1
for /f "delims=" %%a in ('wmic nic get NetConnectionID /format:list') do for /f "tokens=1,* delims=^=" %%b in ("%%a") do CALL :set "%%c"
goto choice
:set
set temporary=%~1
if "%~1"=="" goto india 
set /a counter+=1
set interface[%counter%]=%~1
set /a number=counter+1
CALL set template=%%interface[%counter%]%%
if "X%template%X" NEQ "XX" echo %number%.%template%
:india
Exit /B
:choice
echo.
REM set /p Whatt=_
choice /c 1234567890 /n /M "?"
set error_received=%errorlevel%
if %error_received%==10 (set /a whatt=10 ) else (set /a whatt=%error_received%)
set /a number_of_desire=whatt-1

REM echo %Whatt%| findstr /r "^[0-9]*$" >NUL&&echo. >NUL || goto choice
if %whatt% LSS 1  echo.No exists&goto choice
if %number_of_desire% GEQ 0 CALL set template=%%interface[%number_of_desire%]%%
if "%template%"=="" echo.No exists&goto choice
title %template%
CLS
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^="%template%" ^| find "DHCP enabled:" ') do set dhcpis=%%i
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^="%template%" ^| find "IP Address:" ') do set ipis=%%i
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^="%template%" ^| find "Default Gateway:" ') do set gateis=%%i
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^="%template%" ^| find "Subnet Prefix:" ') do set subnetis=%%i
echo.----------------------------------------------------------------
echo.Hello,
if defined ipis echo.%ipis%
if defined gateis echo.%gateis%
if defined subnetis echo.%subnetis%
echo.----------------------------------------------------------------
echo DHCP Status&echo.%dhcpis%



for /f "tokens=*" %%i in ('netsh  interface ipv4 show addresses name^="%template%" ^| find "DHCP enabled:"') do for /f "tokens=3 delims=: " %%a in ("%%i") do set string=x%%ax
if "%string%"=="xYesx" echo.&echo. Make static?
if "%string%"=="xNox"  echo.&echo. Make dynamic?
choice /c YN /m "Say:"
set /a error=%errorlevel%
if "%error%"=="1" if "%string%"=="xYesx" goto staticonfiguration
if "%error%"=="1" if "%string%"=="xNox"  goto dynamicconfiguration
del xxxxxxxxxx0931092.vbs
del temps23210948.bat
goto :EOF

:dynamicconfiguration



echo mode 60,7 ^&color B5^&echo off^&title Running Command..^& cls ^& echo.netsh interface ipv4 set address name="%template%" source=dhcp  > temps23210948.bat
echo.netsh -c interface ipv4 set address name="%template%" source=dhcp  >> temps23210948.bat
echo.echo Errorlevel=%errorlevel% ^& PAUSE >> temps23210948.bat

if exist temps23210948.bat for /f "tokens=*" %%i in ('dir /s /b .\temps23210948.bat') do set file_nameis=%%i

echo Set objShell = CreateObject("Shell.Application") >xxxxxxxxxx0931092.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>xxxxxxxxxx0931092.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& "%file_nameis%" ^& Chr(34) , "", "runas" >>xxxxxxxxxx0931092.vbs
wscript "xxxxxxxxxx0931092.vbs" 
timeout 2 
del xxxxxxxxxx0931092.vbs
del temps23210948.bat
goto :EOF


:staticonfiguration
:no_good
set /p ip=Enter IP ****
echo %ip%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&&echo.Got it! || echo.no_good&&goto no_good
:not_really
set /p subnet=Enter subnet ***
echo %subnet%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&&echo.Got it! || echo.no_good&&goto not_really
:no_t
set /p gate=Enter gate IP address **
echo %gate%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&&echo.Got it! || echo.no_good&&goto no_t
echo.Done!
echo.Setting in motion..&timeout 1 >NUL&echo|set /p=Running as Administrative priveleges...

echo mode 60,7 ^&color B5^&echo off^&title Running Command..^& cls ^& echo.netsh interface ipv4 set address name="%template%" static %ip% %subnet% %gate% > temps23210948.bat
echo.netsh -c interface ipv4 set address name="%template%" static %ip% %subnet% %gate%  >> temps23210948.bat
echo.echo Errorlevel=%errorlevel% ^& PAUSE >> temps23210948.bat

if exist temps23210948.bat for /f "tokens=*" %%i in ('dir /s /b .\temps23210948.bat') do set file_nameis=%%i

echo Set objShell = CreateObject("Shell.Application") >xxxxxxxxxx0931092.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>xxxxxxxxxx0931092.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& "%file_nameis%" ^& Chr(34) , "", "runas" >>xxxxxxxxxx0931092.vbs 



wscript "xxxxxxxxxx0931092.vbs"





timeout 2

del xxxxxxxxxx0931092.vbs
del temps23210948.bat
goto :EOF
REM ~~i am just butt a christian +-~
REM REM there is power
REM REAL POWER in the kingdom of ^Heaven^
REM the power is in the faith of man.
