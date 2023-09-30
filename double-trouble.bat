set /a counter=-1
for /f "delims=" %%a in ('wmic nic get NetConnectionID /format:list') do for /f "tokens=1,* delims=^=" %%b in ("%%a") do CALL :set "%%c"
goto choice
:set
set temporary=%~1
if "%~1"=="" goto india 
set /a counter+=1
set interface[%counter%]=%~1
set /a number=counter+1
CALL set temp=%%interface[%counter%]%%
if "X%temp%X" NEQ "XX" echo %number%.%temp%
:india
Exit /B
:choice
set /p Whatt=Enter a choice:
set /a number_of_desire=Whatt-1
echo %Whatt%| findstr /r "^[0-9]*$" >NUL&&echo. >NUL || goto choice
if %Whatt% LSS 1  echo.No exists&goto choice
if %number_of_desire% GEQ 0 CALL set temp=%%interface[%number_of_desire%]%%
if "%temp%"=="" echo.No exists&goto choice
netsh interface ipv4 show addresses name="%temp%"
Pause
goto :EOF
for /f "delims=" %%i in ('netsh interface ipv4 show address "%temp%"') do echo "%%i" |  find /i "Subnet" | find /i "mask"&&for /f "tokens=5" %%a in ("%%i") do echo %%a