@echo off
title IGCSE PastPaperOpener 
MODE CON:COLS=91 LINES=30
:: Sets undefined variables
set theme=Dark
set mode=View
set vers=1.22
set Subject=0000
set Session=x
set Year=00
set Type=xx
set Paper=00
::Internet Check
ping www.google.com -n 1 -w 1000 > nul
cls
if errorlevel 1 set int=NO INTERNET AVAILABLE!
::Updator
for /F %%I in ('curl -sS https://raw.githubusercontent.com/mrc2rules/IGCSE_PastPapers_Opener/main/version.txt') do set up=%%I
if not %up%==%vers% set notif=Update Available!(v%up%)
if %up%==%vers% set notif=Program up to date!
:: Home Page
:start
echo.===========================================================================================
echo. %int%
echo.             Welcome! IGCSE Past Paper Opener. Created by Rahbab Chowdhury 2022
echo.                                   
echo.            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.            +                                                                   +
echo.            +                   Mode: Papers will be %mode%ed                     +
echo.            +                                                                   +
echo.            +                   Last Paper: %Subject%_%Session%%Year%_%Type%_%Paper%                      +
echo.            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.                                     ^>^>^>  Options ^<^<^<
echo.
echo.     [Mode: Download^|View] [Theme: Dark^|Light] [Having problems? Type "Help"] [About]
echo.                                %notif%
echo.
echo.[Version %vers%]                                                              %theme% Theme
echo.===========================================================================================
echo.
goto :menu
::Help Menu
:about
echo.===========================================================================================
echo.
echo.                                          About
echo. 
echo.        - This program was created using batch :)
echo.        - No, this program does not miraculously make your internet faster, It merely     
echo.          saves you a few clicks from having to manually open the browser and all.  
echo.            
echo.            
echo.        
echo.
echo.
echo.                                     
echo.
echo.         
echo.
echo.
echo.[Version %vers%]                                                              %theme% Theme
echo.===========================================================================================
pause
goto :start
:: Updator
:update
cls
echo.==========================================================================================
echo.
echo                          ^>^>^> Updating....Please Wait ^<^<^<
echo.
echo.==========================================================================================
echo.
(cd && curl -O https://raw.githubusercontent.com/mrc2rules/IGCSE_PastPapers_Opener/main/PastPaperOpener.bat)
pause
cls
goto :start
:: Keyboard Input
:menu
set /p Subject= Enter subject code: 
if /I "%Subject%" == "update" goto :update
if /I "%Subject%" == "download" set mode=Download & cls & goto :start
if /I "%Subject%" == "view" set mode=View& cls & goto :start
if /I "%Subject%" == "LIGHT" set clr=F0 & set theme=Light & goto :clr
if /I "%Subject%" == "DARK" set clr=07 & set theme=Dark & goto :clr
if /I "%Subject%" == "help" start https://github.com/mrc2rules/IGCSE_PastPapers_Opener/wiki
if /I "%Subject%" == "about" goto :about
set /p Session=Enter letter(FM is m, MJ is s, ON is w): 
set /p Year=Enter year of paper: 
set /p Type=Is it ms or qp?: 
set /p Paper=Enter variant: 
echo.
echo. The paper you have selected is %Subject%_%Session%%Year%_%Type%_%Paper%
echo.
if /I "%mode%" == "download" goto :download
:: Download or View
:confirm
SET /P sure=%mode% Paper? (y/n):
IF /I "%sure%" == "y" goto :%mode%
goto :N
:download
echo Downloading...(Downloads to the directory where this program is located)
echo.
curl https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_%Type%_%Paper%.pdf --output %Subject%_%Session%%Year%_%Type%_%Paper%.pdf
echo.
echo Downloaded! Going back to start
timeout /t 3
cls
goto :start
timeout
:view
echo Opening...
start https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_%Type%_%Paper%.pdf
cls
goto :start
:N
echo ok dumbass, don't waste you time. do sums
timeout /t 5
cls
goto :start
:clr
color %clr%
cls
goto :start
