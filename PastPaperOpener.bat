@echo off
title CAIE PastPaperOpener 
MODE CON:COLS=95 LINES=32

:: Sets Undefined Variables
set mode=View
set vers=1.4

::Internet Check
ping www.google.com -n 1 -w 1000 > nul
cls
if errorlevel 1 goto :e3

::Checks For New Updates
for /F %%I in ('curl -sS https://raw.githubusercontent.com/mrc2rules/IGCSE_PastPapers_Opener/main/version.txt') do set up=%%I
if "%up%" gtr "%vers%" set notif=Update Available!(v%up%)

:: Home Page
:start
cls
echo/===============================================================================================
echo/ %int%
echo/             Welcome!                                    Made with ^<3 by Rahbab!
echo/                                   
:::
:::  ________   ________  ___          __    ___                      ____                       
::: / ___/ _ | /  _/ __/ / _ \___ ____/ /_  / _ \___ ____  ___ ____  / __ \___  ___ ___  ___ ____
:::/ /__/ __ |_/ // _/  / ___/ _ `(_-< __/ / ___/ _ `/ _ \/ -_) __/ / /_/ / _ \/ -_) _ \/ -_) __/
:::\___/_/ |_/___/___/ /_/   \_,_/___|__/ /_/   \_,_/ .__/\__/_/    \____/ .__/\__/_//_/\__/_/   
:::                                                /_/                  /_/                      
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo/                          
echo/
echo/                                     ^>^>^>  Options ^<^<^<
echo/
echo/                         [Mode: Download^|View] Papers will be %mode%ed
echo/
echo/
echo/[Version %vers%]                                           [Having problems? Type "Help"] [About]
echo/===============================================================================================
echo/

:: Menu Options For The User
:menu
set /p Subject= Enter subject code: 
if /I "%Subject%" == "update" goto :update
if /I "%Subject%" == "download" set mode=Download& goto :start
if /I "%Subject%" == "view" set mode=View& goto :start
if /I "%Subject%" == "help" start https://github.com/mrc2rules/IGCSE_PastPapers_Opener/wiki& goto :start
if /I "%Subject%" == "about" cls & goto :about

:: User Input Options
:Year
set /p "Year=Enter the year(last 2 dig.): "
cmd /V /C echo/!Year!| > nul findstr "^[0-9][0-9]$" || goto :e1

:Session
choice /c msw /m "Session?(FM is m, MJ is s, ON is w) "
if %errorlevel% == 1 set Session=m& goto :Variant
if %errorlevel% == 2 set Session=s& goto :Variant
if %errorlevel% == 3 set Session=w& goto :Variant

:Variant
set /p "Variant=Enter variant number: "
cmd /V /C echo/!Variant!| > nul findstr "^[0-9][0-9]$" || goto :e2

:: Paper Validity Checks And Mode 
:webcheck
for /f %%i in ('curl -s -o /dev/null -w "%%{http_code}" https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_qp_%Variant%.pdf') do set RES=%%i
echo/status code : %RES%
if "%RES%" neq "200" (
    goto :e3
) else (
    goto :%mode%
)

:download
cls
echo/============================================================================================
echo/
echo/                                      Downloading...
echo/
echo/                                                 
echo/============================================================================================
echo/
curl https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_qp_%Variant%.pdf --output %Subject%_%Session%%Year%_%Type%_%Variant%.pdf --progress-bar
curl https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_ms_%Variant%.pdf --output %Subject%_%Session%%Year%_%Type%_%Variant%.pdf --progress-bar
echo/
echo/============================================================================================
echo/
echo/                                       Download Complete!
echo/                              Papers saved at %cd%
echo/
echo/============================================================================================
timeout /t 10
goto :start
timeout

:view
echo/Opening...
start https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_qp_%Variant%.pdf
start https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_ms_%Variant%.pdf
cls

:notice
cls
echo/============================================================================================
echo/
echo/                      ^>^>^> Opened selected paper %Subject%_%Session%%Year%_[qp+ms]_%Variant% ^<^<^<
echo/
echo/============================================================================================
timeout /t 10
goto :start

:: Error Dialogs
:e1
mshta javascript:alert("Please enter the last two digits of the year only.\n\nEg: 2013 means 13");close(); & goto :Year
:e2
mshta javascript:alert("Please enter two-digit variant number\nonly.");close(); & goto :Variant
:e3
mshta javascript:alert("You are not connected to the internet");close(); & exit
:e4
cls
echo/============================================================================================
echo/
echo/         ^>^>^> Selected paper %Subject%_%Session%%Year%_%Type%_%Variant%.pdf unavailable at dynamicpapers.com ^<^<^<
echo/
echo/                                                 Returning Home...
echo/============================================================================================
timeout /t 10
goto :start

:: Program Updator
:update
cls
echo/============================================================================================
echo/
echo/                         ^>^>^> Updating....Please Wait ^<^<^<
echo/
echo/============================================================================================
echo/
(cd && curl -O https://raw.githubusercontent.com/mrc2rules/IGCSE_PastPapers_Opener/main/PastPaperOpener.bat)
pause
goto :start
