@echo off & title Ikea Network Switcher
REM You ll get What you pay for.
REM REMember that.

 set colors=
 set /a switch=0
 set /a juggersommer=-1
 set /a gotowhere=0
if exist "computer colors list.txt" for /f "delims=" %%I in ('type "computer colors list.txt"') do set /a juggersommer+=1
if exist colors-29017739820942.conf title Welcome!
if exist colors-29017739820942.conf for /f "delims=" %%i in (colors-29017739820942.conf) do set colors=%%i
color %colors%
goto carry_on
:themes
CLS
if NOT exist "computer colors list.txt" echo. Please download "computer colors list.txt" from the github repository.&pause >NUL&goto carry_on 
for /l %%i in (1,1,%juggersommer%) do CALL :colorit %%i
if %switch% NEQ 1 goto themes
if %switch%==1 goto carry_on
:colorit
if %switch%==1 goto skip
set /a juggernaut=%~1
for /f "skip=%juggernaut% delims=" %%I in ('type "computer colors list.txt"') do for /f "tokens=1" %%A in ("%%I") do set colors=%%A&goto NEXT
:NEXT
color %colors%
echo. This is Sample Text. Brown Fox jumps over the Wild-assed Snakeish scum.
choice /c YNEBCDAFGHIJKLMOPQRSTUVWXZ /m "Press any Alphabet key. Y to save color=%colors%" /n 
set /a errorology=%errorlevel%
if %errorology%==1 echo.%colors% >colors-29017739820942.conf&set /a switch=1
if %errorology%==3 set /a switch=1
:skip
Exit /B
:carry_on
echo. Welcome...
ping -n 1 localhost 1>NUL
if NOT exist colors-29017739820942.conf echo. Don't Freak Out I feel for (all of) ya.
if NOT exist colors-29017739820942.conf ping -n 2 localhost 1>NUL
title Ikea Network Switcher
CLS
set /a counter=-1
for /f "delims=" %%a in ('wmic nic get NetConnectionID /format:list') do for /f "tokens=1,* delims=^=" %%b in ("%%a") do CALL :set "%%c"
goto start
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
:start
set /a total=counter+2
echo.
:choice
REM set /p Whatt=_
choice /c 1234567890 /n /M "?"
set error_received=%errorlevel%
if %error_received%==10 (set /a whatt=10 ) else (set /a whatt=%error_received%)
set /a number_of_desire=whatt-1
set /a somebot=counter+3
REM echo %Whatt%| findstr /r "^[0-9]*$" >NUL&&echo. >NUL || goto choice
if %whatt% LSS 1  echo.No exists&goto choice
if %whatt%==%total% SET /A SWITCH=0&goto themes
if %whatt%==%somebot% start cmd /c "%~fp0"
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
if "%string%"=="xYesx" echo.&echo|set/p=Y^= static,
if "%string%"=="xNox"  echo.&echo|set/p=Y^= dynamic,
echo|set/p= E^=Edit Configuration,
echo|set/p= C^=Copy Addreses to Clipboard,
echo.&echo.
choice /c YNEC /m "Say:          "
set /a error=%errorlevel%
if "%error%"=="1" if "%string%"=="xYesx" goto staticonfiguration
if "%error%"=="1" if "%string%"=="xNox"  goto dynamicconfiguration
if "%error%"=="3" if "%string%"=="xNox"  goto staticonfiguration 
if "%error%"=="3" goto carry_on
if "%error%"=="4" goto copied
goto terminate
:copied
echo.&echo.Press a key to copy!&pause >NUL
if defined ipis for /f "tokens=3" %%i in ("%ipis%") do set ipthing=%%i
if defined ipis echo.[Copied Ip Address!] %ipthing%&echo.&echo.Hit a Key!&echo.%ipthing%|clip&PAUSE >NUL
if defined gateis for /f "tokens=3" %%i in ("%gateis%") do set gatething=%%i
if defined gateis echo.[Copied Gateway!] %gatething%&echo.&echo.Hit a key!&echo.%gatething%|clip&PAUSE >NUL
if defined subnetis for /f "tokens=5 delims=() " %%i in ("%subnetis%") do set mask=%%i
if defined gateis echo.[Subnet Copied!] %mask%&echo.%mask%|clip
:terminate
del xxxxxxxxxx0931092.vbs 2>nul
del temps23210948.bat 2>nul
for /l %%i in (1,1,20) do echo.&echo.&PAUSE >NUL
goto :EOF

:dynamicconfiguration



echo mode 80,7 ^&color %colors%^&echo off^&title Running Command..^& cls ^& echo.netsh interface ipv4 set address name="%template%" source=dhcp  > temps23210948.bat
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
:no_t
set /p gate=Enter gate IP address **
echo %gate%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&&echo.Got it! || echo.no_good&&goto no_t
:not_really
set /p subnet=Enter subnet ***
echo %subnet%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&&echo.Got it! || echo.no_good&&goto not_really
echo.Done!
echo.Setting in motion..&timeout 1 >NUL&echo|set /p=Running as Administrative priveleges...

echo mode 80,7 ^&color %colors%^&echo off^&title Running Command..^& cls ^& echo.netsh interface ipv4 set address name="%template%" static %ip% %subnet% %gate% > temps23210948.bat
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
REM butt is the key word.
