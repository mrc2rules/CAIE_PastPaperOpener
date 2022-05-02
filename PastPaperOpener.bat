@echo off
:start
echo ========================================================================================================================
echo.
echo                  Welcome! Make sure to enter everything in small case. Made by Rahbab Chohgoejxfdgwdhury ©2022
echo.                                      Type UPDATE if you wish to check for updates
echo.                                               
ECHO.                      v1.01 [Changelog: Program now displays which paper you've selected, bug fixes]
echo ========================================================================================================================
goto :menu
:update
cls
echo ========================================================================================================================
echo.
echo                                                Updating....Please Wait.
echo.
echo ========================================================================================================================
echo.
(cd && curl -O https://raw.githubusercontent.com/mrc2rules/IGCSE_PastPapers_Opener/main/PastPaperOpener.bat)
pause
cls
goto :start
:menu
set /p Subject=Enter subject code: 
IF /i "%Subject%" == "UPDATE" GOTO update
set /p Session=Enter letter(FM is m, MJ is s, ON is w): 
set /p Year=Enter year of paper: 
set /p Type=Is it ms or qp?: 
set /p Paper=Enter variant: 
echo. The paper you have selected is %Subject%_%Session%%Year%_%Type%_%Paper%
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
