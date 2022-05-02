@echo off
echo ========================================================================================================================
echo.
echo                  Welcome! Make sure to enter everything in small case. Made by Rahbab Chowdhury ©2022
echo.
echo ========================================================================================================================
echo.
:start
set /p Subject=Enter subject code: 
set /p Session=Enter letter(FM is m, MJ is s, ON is w): 
set /p Year=Enter year of paper: 
set /p Type=Is it ms or qp?: 
set /p Paper=Enter variant: 
echo.
:confirm
SET /P sure=Open Paper? (y/n)
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