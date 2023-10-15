@echo off
title CAIE PastPaperOpener 
MODE CON:COLS=96 LINES=32

:a
:: Sets Undefined Variables
set mode=View
set vers=1.41

::Internet Check
ping www.google.com -n 1 -w 1000 > nul
cls
if errorlevel 1 goto :e3

:: Home Page
:start
cls
echo/================================================================================================
echo/
echo/                Welcome!                                  Made with ^<3 by Rahbab!
echo/
:::
:::   ________   ________  ___          __    ___                      ____                       
:::  / ___/ _ | /  _/ __/ / _ \___ ____/ /_  / _ \___ ____  ___ ____  / __ \___  ___ ___  ___ ____
::: / /__/ __ |_/ // _/  / ___/ _ `(_-< __/ / ___/ _ `/ _ \/ -_) __/ / /_/ / _ \/ -_) _ \/ -_) __/
::: \___/_/ |_/___/___/ /_/   \_,_/___|__/ /_/   \_,_/ .__/\__/_/    \____/ .__/\__/_//_/\__/_/   
:::                                                 /_/                  /_/                      
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo/
echo/
echo/                                     ^>^>^> Options ^<^<^<
echo/
echo/                         [Mode: Download^|View] Papers will be %mode%ed
echo/
echo/
echo/[Version %vers%]                                           [Having problems? Type "Help"] [About]
echo/================================================================================================
echo/

::Updator
for /F %%I in ('curl -sS https://raw.githubusercontent.com/mrc2rules/CAIE_PastPapersOpener/main/version.txt') do set up=%%I
if "%up%" gtr "%vers%" goto :e5

:: Menu Options for the User
:menu
set /p Subject= Enter Subject Code: 
if /I "%Subject%" == "update" goto :update
if /I "%Subject%" == "download" set mode=Download& goto :start
if /I "%Subject%" == "view" set mode=View& goto :start
if /I "%Subject%" == "help" start https://github.com/mrc2rules/CAIE_PastPapersOpener/wiki& goto :start
if /I "%Subject%" == "about" cls & goto :about

:: User Input Options
:Variant
set /p "Variant=Enter Variant Number: "
cmd /V /C echo/!Variant!| > nul findstr "^[0-9][0-9]$" || goto :e2

:Session
choice /c msw /m "Session? (FebMar= M, MayJune= S, OctNov= W) "
if %errorlevel% == 1 set Session=m& goto :Year
if %errorlevel% == 2 set Session=s& goto :Year
if %errorlevel% == 3 set Session=w& goto :Year

:Year
set /p "Year=Enter The Year(last 2 dig.): "
cmd /V /C echo/!Year!| > nul findstr "^[0-9][0-9]$" || goto :e1

:: Paper Validity Checks And Mode
:webcheck
for /f %%i in ('curl -s -o /dev/null -w "%%{http_code}" https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_qp_%Variant%.pdf') do set RES=%%i
echo/status code : %RES%
if "%RES%" neq "200" (
    goto :e4
) else (
    goto :%mode%
)

:about
cls
echo/================================================================================================
echo/
echo/                                   [A B O U T  T H E  A P P]
echo/
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo/
echo/   ^>^>^>  A simple application to open both ms and qp past papers together quickly!!  ^<^<^<
echo/
echo/                                        [Version %vers%]
echo/
echo/             [0. Main Menu] [1. GitHub] [2. Wiki/Help Page] [3. Leaked Exam Papers]
echo/
echo/                                                                        Made with ^<3 by Rahbab!
echo/================================================================================================
set /p about= Enter a number: 
if /I "%about%" == "0" goto :start
if /I "%about%" == "1" start https://github.com/mrc2rules/CAIE_PastPapersOpener/& goto :about
if /I "%about%" == "2" start https://github.com/mrc2rules/CAIE_PastPapersOpener/wiki& goto :about
if /I "%about%" == "3" start https://www.youtube.com/watch?v=-pHhb4biR9k& goto :about

:download
cls
echo/================================================================================================
echo/
echo/
echo/                                         Downloading...
echo/
echo/
echo/================================================================================================
echo/
curl https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_qp_%Variant%.pdf --output %Subject%_%Session%%Year%_qp_%Variant%.pdf --progress-bar
curl https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_ms_%Variant%.pdf --output %Subject%_%Session%%Year%_ms_%Variant%.pdf --progress-bar
cls
echo/================================================================================================
echo/
echo/
echo/                                       Download Complete!
echo/                              Papers saved at %cd%
echo/
echo/================================================================================================
explorer.exe /select,"%cd%\%Subject%_%Session%%Year%_qp_%Variant%.pdf"
timeout /t 15
goto :start

:view
echo/Opening...
start https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_qp_%Variant%.pdf
start https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_ms_%Variant%.pdf
cls

:notice
cls
echo/================================================================================================
echo/
echo/
echo/                    ^>^>^> Opened selected paper %Subject%_%Session%%Year%_[qp+ms]_%Variant% ^<^<^<
echo/
echo/
echo/================================================================================================
timeout /t 10
goto :start

:: Program Updator
:update
cls
if "%up%" LEQ "%vers%" mshta javascript:alert("You're already on the latest \nversion! [ v%vers% ]");close(); & goto :start
echo/================================================================================================
echo/
echo/
echo/                              ^>^>^> Updating....Please Wait ^<^<^<
echo/
echo/
echo/================================================================================================
echo/
(cd && curl -O  -s -S https://raw.githubusercontent.com/mrc2rules/CAIE_PastPapersOpener/main/CAIE_PastPaperOpener.bat)
goto :a

:: Error Dialogs
:e1
mshta javascript:alert("Please enter the last two digits of the year only.\n\nEg: 2013 means 13");close(); & goto :Year
:e2
mshta javascript:alert("Please enter two-digit variant number\nonly.");close(); & goto :Variant
:e3
mshta javascript:alert("You are not connected to the internet!");close(); & exit
:e4
cls
echo/================================================================================================
echo/
echo/    ^>^>^> Selected paper %Subject%_%Session%%Year%_[qp+ms]_%Variant%.pdf is unavailable at dynamicpapers.com ^<^<^<
echo/
echo/
echo/                                       Returning Home....
echo/================================================================================================
timeout /t 15
goto :start
:e5
mshta javascript:alert("An update is available! [v%vers% >> v%up%] \n\nType 'update' to update");close(); & goto :menu
