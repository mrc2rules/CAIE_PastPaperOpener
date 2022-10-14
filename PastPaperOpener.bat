@echo off
title CAIE PastPaperOpener 
MODE CON:COLS=93 LINES=32
:: Sets undefined variables
set mode=View
set vers=1.3

::Internet Check
ping www.google.com -n 1 -w 1000 > nul
cls
if errorlevel 1 set int=NO INTERNET AVAILABLE!
::Updator
for /F %%I in ('curl -sS https://raw.githubusercontent.com/mrc2rules/IGCSE_PastPapers_Opener/main/version.txt') do set up=%%I
if "%up%" gtr "%vers%" set notif=Update Available!(v%up%)
:: Home Page
:start
echo/=============================================================================================
echo/ %int%
echo/             Welcome! CAIE Past Paper Opener.            Made with ^<3 by Rahbab!
echo/                                   
echo/            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo/            +                                                                   +
echo/                                Mode: Papers will be %mode%ed
echo/                                Last Paper: %Subject%_%Session%%Year%_%Type%_%Paper%
echo/            +                                                                   +
echo/            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo/
echo/
echo/                                     ^>^>^>  Options ^<^<^<
echo/
echo/                 [Mode: Download^|View] [Having problems? Type "Help"] [About]
echo/
echo/
echo/[Version %vers%]                                                       %notif%
echo/=============================================================================================
echo/
goto :menu
::Help Menu
:about
echo/=============================================================================================
echo/
echo/                                          About
echo/ 
echo/        - This program was created using batch :)
echo/        - No, this program does not miraculously make your internet faster, It merely     
echo/          saves you a few clicks from having to manually open the browser and all.  
echo/            
echo/            
echo/        
echo/
echo/
echo/                                     
echo/
echo/         
echo/
echo/
echo/[Version %vers%]
echo/=============================================================================================
pause
cls
goto :start
:: Updator
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
cls
goto :start
:: Keyboard Input
:menu
set /p Subject= Enter subject code: 
if /I "%Subject%" == "update" goto :update
if /I "%Subject%" == "download" set mode=Download&cls& goto :start
if /I "%Subject%" == "view" set mode=View&cls& goto :start
if /I "%Subject%" == "help" start https://github.com/mrc2rules/IGCSE_PastPapers_Opener/wiki
if /I "%Subject%" == "about" cls & goto :about
:Year
set /p "Year=Enter the year(last 2 dig.): "
cmd /V /C echo/!Year!| > nul findstr "^[0-9][0-9]$" || goto :e1

:Session
choice /c msw /m "Session?(FM is m, MJ is s, ON is w) "
if %errorlevel% == 1 set Session=m& goto :Type
if %errorlevel% == 2 set Session=s& goto :Type
if %errorlevel% == 3 set Session=q& goto :Type
:Type
set /p Type=Is it ms or qp?:
if /I "%type%" == "ms" set type=ms& goto :Variant
if /I "%type%" == "qp" set type=qp& goto :Variant
mshta javascript:alert("Select either ms or qp only.");close(); & goto :Type
:Variant
set /p "Variant=Enter variant number: "
cmd /V /C echo/!Variant!| > nul findstr "^[0-9][0-9]$" || goto :e2
:ok
cls
echo/============================================================================================
echo/
echo/                      ^>^>^> The paper you have selected is %Subject%_%Session%%Year%_%Type%_%Variant% ^<^<^<
echo/
echo/============================================================================================
:: Download or View
:confirm
SET /P sure=%mode% Paper? (y/n):
IF /I "%sure%" == "y" goto :webcheck
cls
goto :start
:webcheck
for /f %%i in ('curl -s -o /dev/null -w "%%{http_code}" https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_%Type%_%Variant%.pdf') do set RES=%%i
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
curl https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_%Type%_%Variant%.pdf --output %Subject%_%Session%%Year%_%Type%_%Variant%.pdf --progress-bar
echo/
echo/============================================================================================
echo/
echo/                                       Download Complete!
echo/                              File saved at %cd%
echo/
echo/============================================================================================
timeout /t 10
cls
goto :start
timeout
:view
echo/Opening...
start https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_%Type%_%Variant%.pdf
cls
goto :start
:clr
color %clr%
cls
goto :start
:: Error Dialogs
:e1
mshta javascript:alert("Please enter the last two digits of the year only.\n\n2013 means 13");close(); & goto :Year
:e2
mshta javascript:alert("Please enter two-digit variant number\nonly.");close(); & goto :Variant
:e3
cls
echo/============================================================================================
echo/
echo/         ^>^>^> Selected paper %Subject%_%Session%%Year%_%Type%_%Variant%.pdf unavailable at dynamicpapers.com ^<^<^<
echo/
echo/                                                 Returning Home...
echo/============================================================================================
timeout /t 10
cls
goto :start
