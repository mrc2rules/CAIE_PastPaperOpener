@echo off
title IGCSE PastPaperOpener
MODE CON:COLS=90 LINES=30
:start
echo ==========================================================================================
echo                  Welcome! IGCSE PPO. Made by Rahbab Chowdhury 2022  
echo.  
echo.                                
echo                        v1.1   [Options: Update, Dark/Light]      
echo.                     [Changelog: Added abilty to change theme]   
echo ==========================================================================================
goto :menu
:update
cls
echo ==========================================================================================
echo.
echo                                 Updating....Please Wait.
echo.
echo ==========================================================================================
echo.
(cd && curl -O https://raw.githubusercontent.com/mrc2rules/IGCSE_PastPapers_Opener/main/PastPaperOpener.bat)
pause
cls
goto :start
:menu
set /p Subject=Enter subject code: 
if /I "%Subject%" == "update" goto :update
if /I "%Subject%" == "LIGHT" set clr=F0 & goto :clr
if /I "%Subject%" == "DARK" set clr=07 & goto :clr
set /p Session=Enter letter(FM is m, MJ is s, ON is w): 
set /p Year=Enter year of paper: 
set /p Type=Is it ms or qp?: 
set /p Paper=Enter variant: 
echo.
echo. The paper you have selected is %Subject%_%Session%%Year%_%Type%_%Paper%
echo.
:confirm
SET /P sure=Open Paper? (y/n):
IF /I "%sure%" NEQ "y" goto :N
:open
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
