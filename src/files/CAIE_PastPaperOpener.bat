:: CAIE PastPaperOpener
:: Copyright Rahbab Chowdhury
:: Licensed under MIT License
:: https://github.com/mrc2rules/CAIE_PastPaperOpener/
:: DO NOT MAKE CHANGES UNLESS YOU KNOW WHAT YOU ARE DOING

:reload
@echo off & setlocal enableDelayedExpansion
::=====Initialization=====
MODE 100, 38
chcp 65001 >nul
set Version=1.5
title CAIE PastPaperOpener v%version%
call :filecheck
"plugins\NoResize"
echo.[15E
echo.                             ╭──────────────────────────────────────────╮
echo.                             │                                          │
echo.                             │        🌐 Checking for updates...        │
echo.                             │                                          │
echo.                             ╰──────────────────────────────────────────╯
call :updatecheck
call :ascii
call color

::Sets Up config.txt On First Time Start
IF NOT EXIST config.txt (call :setconfig) >nul
call :readconfig

::Background 
:bg
plugins\cmdbkg "%bg%" /c /t 12 2>nul >nul
::Pages Of The Program - Home, About, Settings
:home
cls
if "%YouTube%" == "ON " (set icon=%tGRN%✔️) else (set icon=%tRED%❌)
echo.%gray%                                                                                                  %rst%[38;5;123m
%image% %logo%  
echo.                                             %tred%_____________
echo.               %tYLW%╭────────────────────────────%tred%┬╯ Main Menu ╰┬%tYLW%──────────────────────────╮
echo.               │                                                                     ├%tred%━━━━━━━━━━━━┓%tYLW%
echo.               │                                                                     │            %tred%┃%tYLW%
echo.               │                                                                     │     %tred%▶️     ┃%tYLW%
echo.               │      %rst%Papers will be               %tgray%│               %tHL%%HL% D ^> 💾 Download  %rst%%tYLW%│%rst%   Search   %tred%┃%tYLW%
echo.               │                                   %tgray%│%rst%        Modes:                   %tYLW%│%rst% On YouTube %tred%┃%tYLW%
echo.               │      ▶ %mode%ED                 %tgray%│               %tHL%%HL% P ^> 🌐 Preview   %rst%%tYLW%│            %tred%┃%tYLW%
echo.               │                                                                     │  %rst%%HL% %YouTube% %icon% %rst%  %tred%┃%tYLW%
echo.               │                                                                     │            %tred%┃%tYLW%
echo.               │                                                                     ├%tred%━━━%HL%┫ ^> Y ┣%brst%━━┛%tYLW%
echo.               ╰─%THL%%HL%┨ H ^> ❓ Help Page ┠%RST%%tYLW%──────%THL%%HL%┨ S ^> ☰ Settings ┠%RST%%tYLW%───────%THL%%HL%┨ A ^> ℹ️ About ┠%RST%%TYLW%─╯%rst%
echo.
echo.[%THL%v%version%%rst%]
echo.[38;5;123m──────────────────────────────────────────────────╮ ╭───────────────────────────────────────────────%RST%
echo.%HL%%tgray%   Type something and press %THL%{ENTER}%tgray% to navigate   %rst%[38;5;123m│ │%RST%%hl%%tgray%              Type %THL%B%tgray% to go back ↩️             %rst%
echo.[38;5;123m──────────────────────────────────────────────────╯ ╰───────────────────────────────────────────────%RST%
echo.
echo.  ╭──────────────────────────────────────────────────────────────────────────────────────────────╮
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  ╰────────────────────────────────────────────────────────────────────────%tred% © Rahbab Chowdhury %rst%──╯[8A

:menu
:Subject
<nul set /p "=‎‎│‎|%tYLW%1%rst%|  Type %THL%Subject Code%RST%                               >> "
choice /N /c 0123456789UDPHASYQ
SET /A Subject1=%ERRORLEVEL%-1
if %errorlevel% == 11 goto :update
if %errorlevel% == 12 set mode=DOWNLOAD& goto :home
if %errorlevel% == 13 set mode=PREVIEW & goto :home
if %errorlevel% == 14 start https://github.com/mrc2rules/CAIE_PastPapersOpener/wiki& goto :home
if %errorlevel% == 15 goto :about
if %errorlevel% == 16 goto :settings
if %errorlevel% == 17 (
    if "%YouTube%" == "ON " (
        set YouTube=OFF
    ) else if "%YouTube%" == "OFF" (
        set YouTube=ON 
    )
    call :savesettings
    goto :home
)

echo.[2A
set /p Subject2=‎‎│‎^|%tYLW%1%rst%^|  Type %THL%Subject Code%RST%                               ^>^>[2C
set Subject=%Subject1%%Subject2%

echo %Subject%|findstr /r "^[0-9][0-9][0-9][0-9]$">nul
if errorlevel 1 (
    goto :e6
)
echo.

::Paper Code Prompting
:Variant
set /p Variant=‎‎│‎^|%tYLW%2%rst%^|  Type %THL%Variant Number%RST%                             ^>^> 
if /I "%variant%"=="B" echo.[A[3C[60X[2A[65X[A&goto :Menu
cmd /V /C echo.!Variant!| > nul findstr "^[0-9][0-9]$" || goto :e2
echo.

:Session
<nul set /p "=‎‎│‎|%tYLW%3%rst%|  Type %THL%Session%rst% (FebMar= %und%%THL%M%rst%, MayJune= %und%%THL%S%rst%, OctNov= %und%%THL%W%rst%) >> "
choice /N /c mswb
if %errorlevel% == 1 set Session=m
if %errorlevel% == 2 set Session=s
if %errorlevel% == 3 set Session=w
if %errorlevel% == 4 echo.[A[3C[60X[2A[65X[A&goto :Variant 
echo.

:Year
set /p "Year=‎‎│‎|%tYLW%4%rst%|  Type %THL%Year%RST% (last 2 digits)                       >> "
if /I "%Year%"=="B" echo.[A[3C[60X[2A[65X[A&goto :Session
echo.!Year!| > nul findstr "^[0-9][0-9]$" || goto :e1

call :papercheck
if "%prompt%" == "DISABLED" goto :%mode%

::=====Confirmation Prompt=====
:confirm
if "%mode%" == "PREVIEW " (set lcmode=preview ) else (set lcmode=download)
echo.  [8A%TYLW%╭──────────────────────────────────────────────────────────────────────────────────────────────╮
echo.  │                                                                       %rst%╭───────────────────╮  %TYLW%│
echo.  │                                                                       %rst%│                   │  %TYLW%│
echo.  │          %tRED%^>^>^>%rst% Do you want to %lcmode% %HL%%Subject%_%Session%%Year%_[qp+ms]_%Variant%%RST%? %tRED%^<^<^<%rst%         │                   │  %TYLW%│
echo.  │                                                                       %rst%│        ???        │  %TYLW%│
echo.  │                         %HL%%TGRN%  Y ^> Yes  %RST% %HL%%TRED%  N ^> No  %RST%                        │                   │  %TYLW%│
echo.  │                                                                       %rst%│                   │  %TYLW%│
echo.  │                                                                       %rst%╰───────────────────╯  %TYLW%│
echo.  ╰────────────────────────────────────────────────────────────────────────%tred% © Rahbab Chowdhury %rst%%TYLW%──╯[2A
choice /N /c YN
if %errorlevel% == 1 goto :%mode%
if %errorlevel% == 2 goto :home

:settings
if "%prompt%" == "ENABLED " (set color1=%dGRN%) else (set color1=%dRED%)
if "%defmode%" == "PREVIEW " (set color2=%dGRN%) else (set color2=%dRED%)
if "%logo%" == "logo1" (set color3=%dGRN% 1 %dRED% 2 %dRED% 3 %rst%)
if "%logo%" == "logo2" (set color3=%dRED% 1 %dGRN% 2 %dRED% 3 %rst%)
if "%logo%" == "logo3" (set color3=%dRED% 1 %dRED% 2 %dGRN% 3 %rst%)
if "%qp%" == "ON " (set color4=[38;5;122m) else (set color4=%tGRAY%)
if "%ms%" == "ON " (set color5=[38;5;122m) else (set color5=%tGRAY%)
if "%gt%" == "ON " (set color6=[38;5;122m) else (set color6=%tGRAY%)
if "%er%" == "ON " (set color7=[38;5;122m) else (set color7=%tGRAY%)
cls
echo.%gray%                                                                                                  %rst%[38;5;123m
%image% %logo%
echo.                                            %tred%______________
echo.             %tYLW%╭─────────────────────────────%tred%┬╯ ☰ Settings ╰┬%tYLW%────────────────────────────╮
echo.             │                                                                         │
echo.             │                                                                         │
echo.             │ %THL%1 ^>%rst% Confirmation Prompt - %color1%%prompt% %rst% %tgray%│%THL% 4 ^>%rst% 🌳 Set a Background           %tYLW%│
echo.             │                                     %tgray%│%THL%                                   %tYLW%│
echo.             │ %THL%2 ^>%rst% Default Mode        - %color2%%defmode% %rst% %tgray%│%THL% 5 ^>%rst% 🗑️ Remove Background         %tYLW%│
echo.             │                                     %tgray%│%THL%                                   %tYLW%│
echo.             │ %THL%3 ^>%rst% Logo                - %color3% %tgray%│%THL%                                   %tYLW%│
echo.             │                                                                         │
echo.             │                                                                         │
echo.             ╰───────────────────────────────────────────────────────── %THL%Version %version% %tYLW%─╯
echo.
echo.                       %color4%┌────────────────%hl%%tred%┃  Toggle Paper Type  ┃%rst%%color7%────────────────┐%rst%
echo.                       %color4%│           %color5%┌─────────┘        %color6%│                        %color7%│
echo.                       %color4%│           %color5%│                  %color6%└──────────┐             %color7%│
echo.       %color4%╭───────────────┴──╮  %color5%╭─────┴─────────╮  %color6%╭────────────────┴──╮  %color7%╭───────┴───────────╮
echo.       %color4%│  Question Paper  │  %color5%│  Mark Scheme  │  %color6%│  Grade Threshold  │  %color7%│  Examiner Report  │
echo.       %color4%╰─────┬────────────╯  %color5%╰───────────────╯  %color6%╰───────────────────╯  %color7%╰───────────────────╯%rst%
echo.             └▸ Q                 └▸ M                 └▸ G                    └▸ E
echo.
echo.  ╭──────────────────────────────────────────────────────────────────────────────────────────────╮
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  ╰───────────────────────────────────────────────────────────────────────────%THL%%HL%┨ B ^> Home Page ┠%RST%──╯[3A
<nul set /p "=‎‎│‎|%tYLW%+%rst%|  %THL%Press a key%RST% to toggle settings   >> "
choice /N /c B12345QMGE
if %errorlevel% == 1 goto :home
if %errorlevel% == 2 goto :set1
if %errorlevel% == 3 goto :set2
if %errorlevel% == 4 goto :set3
if %errorlevel% == 5 goto :set4
if %errorlevel% == 6 goto :set5
if %errorlevel% == 7 goto :set6
if %errorlevel% == 8 goto :set7
if %errorlevel% == 9 goto :set8
if %errorlevel% == 10 goto :set9

::Changes Settings Value In config.txt
:set1
if "%prompt%" == "ENABLED " (
    set prompt=DISABLED
) else if "%prompt%" == "DISABLED" (
    set prompt=ENABLED 
)
call :saveSettings
goto :Settings
:set2
if "%defmode%" == "PREVIEW " (
    set defmode=DOWNLOAD
) else if "%defmode%" == "DOWNLOAD" (
    set defmode=PREVIEW 
)
call :saveSettings
goto :Settings
:set3
if "%logo%" == "logo1" (
    set logo=logo2
) else if "%logo%" == "logo2" (
    set logo=logo3
) else if "%logo%" == "logo3" (
    set logo=logo1
)
call :saveSettings
goto :Settings
:set4
chcp 437 > nul
set "%bg%"==""
set ps_bg=bg.ps1
echo [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") ^| out-null > %ps_bg%
echo $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog >> %ps_bg%
echo $OpenFileDialog.initialDirectory = "%USERPROFILE%\Downloads" >> %ps_bg%
echo $OpenFileDialog.filter = "Select Image (*.png;*.jpg)|*.png; *.jpg" >> %ps_bg%
echo $OpenFileDialog.ShowDialog() >> %ps_bg%
echo $OpenFileDialog.filename >> %ps_bg%
for /F "tokens=* usebackq" %%a in (`powershell -executionpolicy bypass -file %ps_bg%`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set selbg=%%a
del %ps_bg%
chcp 65001 >nul
if not "%selbg%"=="" (set bg=%selbg%)&(call :savesettings)&(goto :bg) else (goto :settings)
:set5
set bg= &call :savesettings&goto :bg
:set6
if "%qp%" == "ON " (
    set qp=OFF
) else if "%qp%" == "OFF" (
    set qp=ON 
)
call :saveSettings
goto :Settings
:set7
if "%ms%" == "ON " (
    set ms=OFF
) else if "%ms%" == "OFF" (
    set ms=ON 
)
call :saveSettings
goto :Settings
:set8
if "%gt%" == "ON " (
    set gt=OFF
) else if "%gt%" == "OFF" (
    set gt=ON 
)
call :saveSettings
goto :Settings
:set9
if "%er%" == "ON " (
    set er=OFF
) else if "%er%" == "OFF" (
    set er=ON 
)
call :saveSettings
goto :Settings

:about
cls
echo.#4%HL%it is version one point five impossible is nothing%rst%
echo.%gray%                                                                                                  %rst%
%image% %logo%
echo. %tRED%^>^>%rst% A comprehensive tool that lets you access %thl%multiple%rst% CAIE exam papers %it%quickly and efficiently^^!%rst% %tRED%^<^<%rst%
echo.
echo.                                             %tred%____________
echo.                 %tYLW%╭──────────────────────────%tred%┬╯ ℹ️ About ╰┬%tYLW%───────────────────────────╮
echo.                 │                                                                   │
echo.                 │                                                                   │
echo.                 │   %THL%1 ^>%rst% 🌐 GitHub                 %THL%│   3 ^>%rst% ⚖️ License                %tYLW%│
echo.                 │                                 %THL%│                                 %tYLW%│
echo.                 │   %THL%2 ^>%rst% ❓ Wiki/Help Page         %THL%│   4 ^>%rst% 📃 Leaked Exam Papers     %tYLW%│
echo.                 │                                                                   %tYLW%│
echo.                 │                        %THL%%HL% 5 ^> Join Discord^^! %rst%                        %tYLW%│
echo.                 │                                                                   │
echo.                 ╰─────────────────────────────────────────────────── %THL%Version %version% %tYLW%─╯%rst%
echo.
echo.
echo.%gray%                                                                                                  %rst%
echo.#3%HL%nothing is impossible five point one version is it%rst%
echo.
echo.
echo.  ╭──────────────────────────────────────────────────────────────────────────────────────────────╮
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  ╰───────────────────────────────────────────────────────────────────────────%THL%%HL%┨ B ^> Home Page ┠%RST%──╯[3A
<nul set /p "=‎‎│‎|%tYLW%+%rst%|  %THL%Press a number%RST% to navigate                      >> "
choice /N /c B12345
if %errorlevel% == 1 goto :home
if %errorlevel% == 2 start https://github.com/mrc2rules/CAIE_PastPapersOpener/& goto :about
if %errorlevel% == 3 start https://github.com/mrc2rules/CAIE_PastPapersOpener/wiki& goto :about
if %errorlevel% == 4 start https://github.com/mrc2rules/CAIE_PastPapersOpener/blob/main/LICENSE goto :about
if %errorlevel% == 5 start https://media.tenor.com/qRq-Dq-uA24AAAAC/rick-roll.gif& goto :about 
if %errorlevel% == 6 start https://discord.gg/Sb6QRYDxKG& goto :about 

:PREVIEW
echo. [7A[73C%TGRN%╭───────────────────╮%RST%
echo. [73C%TGRN%│                   │%RST%
echo. [73C%TGRN%│  Opened the paper │%RST%
echo. [73C%TGRN%│                   │%RST%
echo. [73C%TGRN%│%HL%%Subject%_%Session%%Year%_[qp+ms]_%Variant%%bRST%│%RST%
echo. [73C%TGRN%│                   │%RST%
echo. [73C%TGRN%╰───────────────────╯%RST%
if "%qp%" == "ON " start https://pastpapers.papacambridge.com/directories/CAIE/CAIE-pastpapers/upload/%Subject%_%Session%%Year%_qp_%Variant%.pdf
if "%ms%" == "ON " start https://pastpapers.papacambridge.com/directories/CAIE/CAIE-pastpapers/upload/%Subject%_%Session%%Year%_ms_%Variant%.pdf
if "%gt%" == "ON " start https://pastpapers.papacambridge.com/directories/CAIE/CAIE-pastpapers/upload/%Subject%_%Session%%Year%_gt.pdf
if "%er%" == "ON " start https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_er.pdf
if "%YouTube%" == "ON " start https://www.youtube.com/results?search_query=%Subject%+%Session%%Year%+%Variant%
timeout /t 3 >NUL
goto :home

:DOWNLOAD
::Sets the values from %Session% into full month names
if "%Session%" == "s" set month=May June
if "%Session%" == "m" set month=Feb March
if "%Session%" == "w" set month=Oct Nov
::Creates organized directories
if NOT exist "..\Past Papers\%SUBJECT%\20%YEAR%\%MONTH%\" mkdir "..\Past Papers\%SUBJECT%\20%YEAR%\%MONTH%" >nul
echo. [7A[73C%TYLW%╭───────────────────╮
echo. [73C│   Downloading...  │
echo. [73C│                   │
echo. [73C│                   │
echo. [73C│                   │
echo. [73C│                   │
echo. [73C╰───────────────────╯%RST%[5A
if "%YouTube%" == "ON " start https://www.youtube.com/results?search_query=%Subject%+%Session%%Year%+%Variant%
if "%qp%" == "ON " (
	echo. [73C│ %RST%Question Paper ^>%TRED%❌%TYLW%│
    curl -s https://pastpapers.papacambridge.com/directories/CAIE/CAIE-pastpapers/upload/%Subject%_%Session%%Year%_qp_%Variant%.pdf > "..\Past Papers"\%SUBJECT%\20%YEAR%\"%MONTH%"\%Subject%_%Session%%Year%_qp_%Variant%.pdf
    echo. [A[73C%TYLW%│ %RST%Question Paper ^>%TGRN%✔️%TYLW%│
)
if "%ms%" == "ON " (
	echo. [73C│ %RST%Mark Scheme    ^>%TRED%❌%TYLW%│
	curl -s https://pastpapers.papacambridge.com/directories/CAIE/CAIE-pastpapers/upload/%Subject%_%Session%%Year%_ms_%Variant%.pdf > "..\Past Papers"\%SUBJECT%\20%YEAR%\"%MONTH%"\%Subject%_%Session%%Year%_ms_%Variant%.pdf
	echo. [A[73C%TYLW%│ %RST%Mark Scheme    ^>%TGRN%✔️%TYLW%│
)
if "%gt%" == "ON " (
	echo. [73C│ %RST%Grade Thres.   ^>%TRED%❌%TYLW%│
	curl -s https://pastpapers.papacambridge.com/directories/CAIE/CAIE-pastpapers/upload/%Subject%_%Session%%Year%_gt.pdf > "..\Past Papers"\%SUBJECT%\20%YEAR%\"%MONTH%"\%Subject%_%Session%%Year%_gt.pdf
	echo. [A[73C%TYLW%│ %RST%Grade Thres.   ^>%TGRN%✔️%TYLW%│
)
if "%er%" == "ON " (
	echo. [73C│ %RST%Examiner Rep.  ^>%TRED%❌%TYLW%│
	curl -s https://dynamicpapers.com/wp-content/uploads/2015/09/%Subject%_%Session%%Year%_er.pdf > "..\Past Papers"\%SUBJECT%\20%YEAR%\"%MONTH%"\%Subject%_%Session%%Year%_er.pdf
	echo. [A[73C%TYLW%│ %RST%Examiner Rep.  ^>%TGRN%✔️%TYLW%│
)
::Opens the past paper in explorer, highlighted
explorer.exe "..\Past Papers"\%SUBJECT%\20%YEAR%\"%MONTH%"\
timeout /t 5 >NUL
goto :home

::Program Updator
:update
if "%up%" LEQ "%version%" call msgbox "You're already on the latest version, [v%version%]"  "0+64" "Up to date" & goto :home
rename updater.bat tempupdater.bat
start tempupdater.bat
exit

::=====Configuration Settings=====
::Settings Per Line - Confirmation Prompt, Default Mode, YouTube, Logo, Background, QP, MS, GT, ER
:setconfig
(
  echo.DISABLED
  echo.PREVIEW 
  echo.OFF
  echo.logo2
  echo.bgpathhere
  echo.ON 
  echo.ON 
  echo.OFF
  echo.OFF
) > config.txt
goto :eof
::Reads Data From config.txt And Saves Them Into Variables
:readconfig
for /f "tokens=*" %%L in (config.txt) do (
    set /a line+=1
    if !line!==1 set "prompt=%%L"
    if !line!==2 set "defmode=%%L" 
    if !line!==3 set "YouTube=%%L"
    if !line!==4 set "logo=%%L"
	if !line!==5 set "bg=%%L"
	if !line!==6 set "qp=%%L"
	if !line!==7 set "ms=%%L"
	if !line!==8 set "gt=%%L"
	if !line!==9 set "er=%%L"
)
set mode=%defmode%
goto :eof
::Saves Data From Variables Into config.txt
:saveSettings
(
  echo.%prompt%
  echo.%defmode%
  echo.%YouTube%
  echo.%logo%
  echo.%bg%
  echo.%qp%
  echo.%ms%
  echo.%gt%
  echo.%er%
) > config.txt
call :readconfig
goto :eof

::=====Checks=====
::Checks For Internet
:internetcheck
curl --head --silent --fail www.google.com > nul
if %errorlevel% NEQ 0 (
    if errorlevel 1 goto :e3 
)
::Checks Paper Availability
:papercheck
echo. [7A[73C%TYLW%╭───────────────────╮%RST%
echo. [73C%TYLW%│                   │%RST%
echo. [73C%TYLW%│   Checking if     │%RST%
echo. [73C%TYLW%│   the paper is    │%RST%
echo. [73C%TYLW%│   available...    │%RST%
echo. [73C%TYLW%│                   │%RST%
echo. [73C%TYLW%╰───────────────────╯%RST%

for /f %%i in ('curl -Is -X GET -o NUL -w "%%{http_code}" https://pastpapers.papacambridge.com/directories/CAIE/CAIE-pastpapers/upload/%Subject%_%Session%%Year%_qp_%Variant%.pdf') do set RES=%%i
if "%RES%" neq "200" (
    goto :e4
)
goto :eof

::Checks If All Files Are Present
:filecheck
for %%F in (
    "plugins\cmdbkg.exe"
    "plugins\cmdbkg.rc"
    "plugins\cmdbkg.c"
    "plugins\NoResize.exe"
	"msgbox.bat"
	"updater.bat"
	"run.bat"
) do (
    if not exist %%F (
        set "missingfile=%%~nxF"
        goto :e7
    )
)
goto :eof
::Checks For New Updates
:updatecheck
if "%update%" == "no" goto :eof
for /f "tokens=1,2 " %%A In ('curl -s https://api.github.com/repos/mrc2rules/CAIE_PastPaperOpener/releases/latest') do (
    if ""tag_name":"=="%%A" (
        set up=%%~B
        set up=!up:,=!
		set up=!up:"=!
        set up=!up:v=!
        if "!up!" gtr "!version!" (
              call :e5
        )
    )
)
goto :eof

::=====Error Dialogs=====
::Invalid Year
:e1
call msgbox "Please enter the last two digits of the year only.\n\nEg: 2023 means 23"  "0+64" "Invalid Year"
echo.[A[97X[A
goto :Year
::Invalid Variant
:e2
call msgbox "Please enter a two digit variant number only."  "0+64" "Invalid Variant Number"
echo.[A[97X[A
goto :Variant
::No Internet
:e3
call msgbox "You are not connected to the internet.\n\nPlease connect and retry."  "5+48" "No Internet"
if errorlevel 4 (
        goto :internetcheck
    ) else if errorlevel 2 (
        exit
    )
::Paper Unavailable
:e4
echo. [7A[73C%TRED%╭───────────────────╮%RST%
echo. [73C%TRED%│                   │%RST%
echo. [73C%TRED%│%HL%%Subject%_%Session%%Year%_[qp+ms]_%Variant%%bRST%│%RST%
echo. [73C%TRED%│   is unavailable  │%RST%
echo. [73C%TRED%│                   │%RST%
echo. [73C%TRED%│   Please retry.   │%RST%
echo. [73C%TRED%╰───────────────────╯%RST%
timeout /t 3 >nul
goto :home
:e5
call msgbox "An update is available.\n\nCurrent Version > v%version%\nNew Version      > v%up%\n\nDo you want to update?"  "4+64" "Update"	
if errorlevel = 7 (
        set update=no&goto :eof
    ) else (
        goto :update
    )
::Invalid Subject Code
:e6
call msgbox "Please enter a 4 digit paper code or a letter only."  "0+64" "Invalid Input"
echo.[A[97X[A
goto :Menu
::Missing Files
:e7
call msgbox "Missing file --> %missingfile%.\n\nThe program was unable to start"  "0+48" "Missing Files"
exit 

::ASCII Art
:ascii
(set \n=^^^
%= This creates an escaped Line Feed - DO NOT ALTER =%
)
set image=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1" %%1 in ("^!args^!") do (%\n%
    for /f "tokens=2 delims=:" %%I in ('findstr /b ":%%~1:" "%~f0"') do echo=%%I%\n%
)) else set args=
goto :eof

:logo1: 
:logo1: 
:logo1:         ________   ________  ___          __  ___                   ____                     
:logo1:        / ___/ _ | /  _/ __/ / _ \___ ____/ /_/ _ \___ ____ ___ ____/ __ \___ ___ ___ ___ ____
:logo1:       / /__/ __ |_/ // _/  / ___/ _ `(_-/ __/ ___/ _ `/ _ / -_/ __/ /_/ / _ / -_/ _ / -_/ __/
:logo1:       \___/_/ |_/___/___/ /_/   \_,_/___\__/_/   \_,_/ .__\__/_/  \____/ .__\__/_//_\__/_/   
:logo1:                                                     /_/               /_/                                              
:logo1: 
:logo1: 

:logo2: 
:logo2: 
:logo2:        ___   _   ___ ___   ___         _   ___                    ___                        
:logo2:       / __| /_\ |_ _| __| | _ \__ _ __| |_| _ \__ _ _ __ ___ _ _ / _ \ _ __ ___ _ _  ___ _ _ 
:logo2:      | (__ / _ \ | || _|  |  _/ _` (_-|  _|  _/ _` | '_ / -_| '_| (_) | '_ / -_| ' \/ -_| '_|
:logo2:       \___/_/ \_|___|___| |_| \__,_/__/\__|_| \__,_| .__\___|_|  \___/| .__\___|_||_\___|_|  
:logo2:                                                    |_|                |_|                    
:logo2: 
:logo2: 
:logo2: 

:logo3: 
:logo3: 
:logo3:    _____ _____ _____ _____    _____         _   _____                 _____                     
:logo3:   |     |  _  |     |   __|  |  _  |___ ___| |_|  _  |___ ___ ___ ___|     |___ ___ ___ ___ ___ 
:logo3:   |   --|     |-   -|   __|  |   __| .'|_ -|  _|   __| .'| . | -_|  _|  |  | . | -_|   | -_|  _|
:logo3:   |_____|__|__|_____|_____|  |__|  |__,|___|_| |__|  |__,|  _|___|_| |_____|  _|___|_|_|___|_|  
:logo3:                                                          |_|               |_|                  
:logo3: 
:logo3: 
:logo3: 
