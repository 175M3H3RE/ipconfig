@echo off & title Ikea Network Switcher
REM You ll get What you pay for.
REM REMember that.
REM Remember me.

goto begin
:begin
 set colors=


if exist colors-29017739820942.conf title Welcome!
if exist colors-29017739820942.conf for /f "delims=" %%i in (colors-29017739820942.conf) do set colors=%%i
color %colors%
goto carry_on
:themes
CLS
setlocal enabledelayedexpansion
title Themes!
echo.Press E to Exit
set /a switch=0
REM Something
set colorlist=^


REM Something
REM To Add Colors Add a line--> set color5=4c
REM Where 4c is example color code
REM And change variable colors to reflect additional color variable like
REM set colors=!color1!!colorlist!!color2!!colorlist!!color3!!colorlist!!color4!!colorlist!!color5!

set color1=47
set color2=02
set color3=06
set color4=07
set colors=!color1!!colorlist!!color2!!colorlist!!color3!!colorlist!!color4!
for /f "delims=" %%i in ("!colors!") do CALL :colorit %%i
if %switch% NEQ 1 goto themes
if %switch%==1 Endlocal&Exit /B
:colorit
if %switch%==1 goto skip
set colos=%~1
color %colos%
echo. This is Sample Text. Brown Fox jumps over the Wild-assed Snakeish scum.
choice /c YNEBCDAFGHIJKLMOPQRSTUVWXZ /m "Press any Alphabet key. Y to save color=%colos%" /n 
set /a errorology=%errorlevel%
if %errorology%==1 echo.%colos% >colors-29017739820942.conf&set /a switch=1
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

for /f "skip=3 delims=" %%a in ('netsh interface show interface') do for /f "tokens=1,2,3*" %%b in ("%%a") do if %%e NEQ "" echo "%%e"|findstr /r "[%%]" >NUL&&(echo.&echo..-Bat---Attention--required-!-!---------------------&echo.^|Found offensive character '%%' Interface name      ^|&echo.^|Unable to proceed with this interface due to this.^|&echo.^|offending character, therefore                    ^|&echo.^|please change it's name!                          ^|&echo.----------------------------------------------------&echo.Error Details: Interface Name: [%%e]&echo.&echo.Press Any Key to Open Network Adapter connection...&PAUSE >NUL&ncpa.cpl ) || call :set "%%e"
goto start
:set
set temporary=%1
if %1=="" goto india 
set /a counter+=1
set interface[%counter%]=%1
set /a number=counter+1

CALL set template=%%interface[%counter%]%%


if %template% NEQ "" echo %number%.%template%
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
if %whatt%==%total% SET /A SWITCH=0&CALL :themes&goto Carry_on
if %whatt%==%somebot% start cmd /c "%~fp0"
if %number_of_desire% GEQ 0 CALL set template=%%interface[%number_of_desire%]%%
if %template%=="" echo.No exists&goto choice
title %template%
CLS
SET dhcpis=
set ipis=
set gateis=
set subnetis=
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^=%template% ^| find "DHCP enabled:" ') do set dhcpis=%%i
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^=%template% ^| find "IP Address:" ') do set ipis=%%i
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^=%template% ^| find "Default Gateway:" ') do set gateis=%%i
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^=%template% ^| find "Subnet Prefix:" ') do set subnetis=%%i

for /f "tokens=*" %%i in ('netsh  interface ipv4 show addresses name^=%template% ^| find "DHCP enabled:"') do for /f "tokens=3 delims=: " %%a in ("%%i") do set string=x%%ax



if "%string%"=="xNox" echo.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxit's  a static configurationxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
if "%string%"=="xYesx"  echo.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxit's  dynamic configurationxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
call :string_counter "%dhcpis%"

call :string_counter "%ipis%"

call :string_counter "%gateis%"

call :string_counter "%subnetis%"
                      echo.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxthat's all folks !xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo.
echo.     ----------------------------------------------------------------
echo.    ^|Hello Dear Buddy,                                               ^|
echo.    ^|The settings as defined above are for you to see.               ^|
echo.    ^|Don't be agravated by them.                                     ^|
echo.    ^|In the name of the Lord, Arise^!                                 ^|
echo.     ----------------------------------------------------------------
REM echo. DHCP Status&echo.%dhcpis%

if "%string%"=="xYesx" echo.&echo|set/p=[Y/E]^=Make it a Static Configuration, C^=Copy Addreses to Clipboard, X^=go Back
if "%string%"=="xNox"  echo.&echo|set/p=Y^=Switch to a dynamic configuration, E^=Edit Configuration, C^=Copy Addreses to Clipboard, X^=go Back
echo.&echo.


echo.&echo.
choice /c YNECX /m " . ?" /N
set /a error=%errorlevel%
if "%error%"=="1" if "%string%"=="xYesx" goto staticonfiguration
if "%error%"=="1" if "%string%"=="xNox"  goto dynamicconfiguration
if "%error%"=="3" if "%string%"=="xNox"  goto editer 
if "%error%"=="3" goto carry_on
if "%error%"=="4" goto copied
if "%error%"=="5"  goto carry_on

goto terminate
:copied
echo.&echo.Press a key to copy!&pause >NUL
set ipthing=
set gatething=
set mask=
if defined ipis for /f "tokens=3" %%i in ("%ipis%") do set ipthing=%%i
if defined ipis echo.[Copied Ip Address!] %ipthing%&echo.&echo.Hit a Key!&echo.%ipthing%|clip&PAUSE >NUL
if defined gateis for /f "tokens=3" %%i in ("%gateis%") do set gatething=%%i
if defined gateis echo.[Copied Gateway!] %gatething%&echo.&echo.Hit a key!&echo.%gatething%|clip&PAUSE >NUL
if defined subnetis for /f "tokens=5 delims=() " %%i in ("%subnetis%") do set mask=%%i
if defined gateis echo.[Copied Subnet!] %mask%&echo.%mask%|clip
:terminate
del xxxxxxxxxx0931092.vbs 2>nul
del temps23210948.bat 2>nul
for /l %%i in (1,1,20) do echo.&echo.&call :choose
goto :EOF
:choose
title Try again: Y or N
choice /c yN /m " Try Again?" /N 
if %errorlevel%==1 goto copied
if %errorlevel%==2 goto carry_on
Exit /B

:dynamicconfiguration



echo mode 80,7 ^&color %colors%^&echo off^&title Running Command..^& cls ^& echo.netsh interface ipv4 set address name=%template% source=dhcp  > temps23210948.bat
echo.netsh -c interface ipv4 set address name=%template% source=dhcp  >> temps23210948.bat
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
:doit
echo.Done!
echo.Setting in motion..&timeout 1 >NUL&echo|set /p=Running as Administrative priveleges...

echo mode 80,7 ^&color %colors%^&echo off^&title Running Command..^& cls ^& echo.netsh interface ipv4 set address name=%template% static %ip% %subnet% %gate% > temps23210948.bat
echo.netsh -c interface ipv4 set address name=%template% static %ip% %subnet% %gate%  >> temps23210948.bat
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
:editer
title S = Save [ Press P for menu ]
if defined ipis for /f "tokens=3" %%i in ("%ipis%") do set ipthing=%%i
if defined gateis for /f "tokens=3" %%i in ("%gateis%") do set gatething=%%i
if defined subnetis for /f "tokens=5 delims=() " %%i in ("%subnetis%") do set mask=%%i
if not defined ipthing set ipthing=
set ipstring=Enter IP:             %ipthing%
CLS
echo.-%template%-
echo|set /p=%ipstring%
:loop1
choice /c 1234567890xdsp >NUL
set error=%errorlevel%
if %error%==1 set ipstring=%ipstring%1
if %error%==2 set ipstring=%ipstring%2
if %error%==3 set ipstring=%ipstring%3
if %error%==4 set ipstring=%ipstring%4
if %error%==5 set ipstring=%ipstring%5
if %error%==6 set ipstring=%ipstring%6
if %error%==7 set ipstring=%ipstring%7
if %error%==8 set ipstring=%ipstring%8
if %error%==9 set ipstring=%ipstring%9
if %error%==10 set ipstring=%ipstring%0
if %error%==11 set ipstring=%ipstring%.
if %error%==12 if "%ipstring%" NEQ "Enter IP:             " set ipstring=%ipstring:~0,-1%
if %error%==13 goto x1
if %error%==14 goto carry_on
cls
echo.-%template%-
echo|set/p=%ipstring%                        
echo. (x) - add dot .    (d) - delete   (s) - next
goto loop1
:x1
for /f "tokens=3 delims=: " %%i in ("%ipstring%") do set ip=%%i
echo %ip%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$" >NUL&&echo. >NUL || echo.no_good&&goto loop1
echo %ip%| findstr /r "[0-9][0-9][0-9][0-9][0-9]*" >NUL&&(echo.Excessive Digits in Ip&goto loop1)

if not defined gatething set gatething=
set gatestring=Enter Gateway:        %gatething%
CLS
echo.-%template%-
echo.%ipstring%
echo|set /p=%gatestring%
:loop2
choice /c 1234567890xdsp >NUL
set error=%errorlevel%
if %error%==1 set gatestring=%gatestring%1
if %error%==2 set gatestring=%gatestring%2
if %error%==3 set gatestring=%gatestring%3
if %error%==4 set gatestring=%gatestring%4
if %error%==5 set gatestring=%gatestring%5
if %error%==6 set gatestring=%gatestring%6
if %error%==7 set gatestring=%gatestring%7
if %error%==8 set gatestring=%gatestring%8
if %error%==9 set gatestring=%gatestring%9
if %error%==10 set gatestring=%gatestring%0
if %error%==11 set gatestring=%gatestring%.
if %error%==12 if "%gatestring%" NEQ "Enter Gateway:        " set gatestring=%gatestring:~0,-1%
if %error%==13 goto x2
if %error%==14 goto carry_on
cls
echo.-%template%-
echo.%ipstring%
echo|set/p=%gatestring%                        
echo. (x) - add dot .    (d) - delete   (s) - next   
goto loop2
:x2
for /f "tokens=3 delims=: " %%i in ("%gatestring%") do set gate=%%i
echo %gate%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$" >NUL&&echo. >NUL || echo.no_good&&goto loop2
echo %gate%| findstr /r "[0-9][0-9][0-9][0-9][0-9]*" >NUL&&(echo.Excessive Digits in Gate way&goto loop2)

if not defined mask set mask=
set subnetmask=Enter Subnet mask:    %mask%
CLS
echo.-%template%-
echo.%ipstring%
echo.%gatestring%
echo|set /p=%subnetmask%
:loop3
choice /c 1234567890xdsp >NUL
set error=%errorlevel%
if %error%==1 set subnetmask=%subnetmask%1
if %error%==2 set subnetmask=%subnetmask%2
if %error%==3 set subnetmask=%subnetmask%3
if %error%==4 set subnetmask=%subnetmask%4
if %error%==5 set subnetmask=%subnetmask%5
if %error%==6 set subnetmask=%subnetmask%6
if %error%==7 set subnetmask=%subnetmask%7
if %error%==8 set subnetmask=%subnetmask%8
if %error%==9 set subnetmask=%subnetmask%9
if %error%==10 set subnetmask=%subnetmask%0
if %error%==11 set subnetmask=%subnetmask%.
if %error%==12 if "%subnetmask%" NEQ "Enter Subnet mask:    " set subnetmask=%subnetmask:~0,-1%
if %error%==13 goto x3
if %error%==14 goto carry_on
cls
echo.-%template%-
echo.%ipstring%
echo.%gatestring%
echo|set/p=%subnetmask%                        
echo. (x) - add dot .    (d) - delete   (s) - next  
goto loop3
:x3
for /f "tokens=4 delims=: " %%i in ("%subnetmask%") do set subnet=%%i
echo %subnet%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$" >NUL&&echo. >NUL || echo.no_good&&goto loop3
echo %subnet%| findstr /r "[0-9][0-9][0-9][0-9][0-9]*" >NUL&&(echo.Excessive Digits in Ip&goto loop3)
echo.
pause >NUL
goto doit
goto :EOF
:string_counter
setlocal enabledelayedexpansion
set /a heyhey=100
set string=%~1
set /a tount=0
if defined string for /l %%i in (0,1,150) do set temp=!string:~%%i,1!&set /a tount+=1&if "z!temp!z"=="zz" goto nt
:nt
if not defined string set /a tount=1
set /a tount=tount-1
set /a leftover=heyhey-tount
REM White Space Sensitive code
set space= 
for /l %%i in (1,1,!leftover!) do set space= !space!
echo.|set/p=x%string%!space!X
echo.
Endlocal disabledelayedexpansion
Exit /B

REM the power is in being a man
REM ~~i am just butt a christian +-~
REM   butt is the key word here 
REM The bride and the bridegroom.
REM REM there is power
REM REAL POWER in the kingdom of ^Heaven^
REM the power is in the faith of man.
REM butt is the key word.
