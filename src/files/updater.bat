@echo off
title Updating...
MODE 100, 25
chcp 65001 >nul
call color
echo.  %tylw%╭──────────────────────────────────────────────────────────────────────────────────────────────╮
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │     %thl%___   _   ___ ___   ___         _   ___                    ___                           %tylw%│
echo.  │    %thl%/ __^| /_\ ^|_ _^| __^| ^| _ \__ _ __^| ^|_^| _ \__ _ _ __ ___ _ _ / _ \ _ __ ___ _ _  ___ _ _    %tylw%│
echo.  │   %thl%^| (__ / _ \ ^| ^|^| _^|  ^|  _/ _` (_-^|  _^|  _/ _` ^| '_ / -_^| '_^| (_) ^| '_ / -_^| ' \/ -_^| '_^|   %tylw%│
echo.  │   %thl% \___/_/ \_^|___^|___^| ^|_^| \__,_/__/\__^|_^| \__,_^| .__\___^|_^|  \___/^| .__\___^|_^|^|_\___^|_^|     %tylw%│ 
echo.  │                                                 %thl%^|_^|                ^|_^|                       %tylw%│
echo.  │                                                                                              │
echo.  │                                                                       %tORG%z                      %tylw%│
echo.  │                                                                      %tORG%z                       %tylw%│
echo.  │                                                               %tORG%/\_/\ z                        %tylw%│
echo.  │                                                              %tORG%( -.- )                         %tylw%│
echo.  │                                                               %tORG%^> ^^ ^<                          %tylw%│
echo.  │                         %thl%%hl%╭──────────────────────────────────────────╮%rst%                         %tylw%│
echo.  │                         %thl%%hl%│                                          │%rst%                         %tylw%│
echo.  │                         %thl%%hl%│        ⌛ %it%Updating...Please Wait.        │%rst%                         %tylw%│
echo.  │                         %thl%%hl%│                                          │%rst%                         %tylw%│
echo.  │                         %thl%%hl%╰──────────────────────────────────────────╯%rst%                         %tylw%│
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  │                                                                                              │
echo.  ╰────────────────────────────────────────────────────────────────────────%tred% © Rahbab Chowdhury %tylw%──╯[A
curl -sSO https://raw.githubusercontent.com/mrc2rules/CAIE_PastPaperOpener/main/src/files/Run.bat
curl -sSO https://raw.githubusercontent.com/mrc2rules/CAIE_PastPaperOpener/main/src/files/ascii.bat
curl -sSO https://raw.githubusercontent.com/mrc2rules/CAIE_PastPaperOpener/main/src/files/color.bat
curl -sSO https://raw.githubusercontent.com/mrc2rules/CAIE_PastPaperOpener/main/src/files/msgbox.bat
curl -sSO https://raw.githubusercontent.com/mrc2rules/CAIE_PastPaperOpener/main/src/files/CAIE_PastPaperOpener.bat
curl -sSO https://raw.githubusercontent.com/mrc2rules/CAIE_PastPaperOpener/main/src/files/updater.bat
del config.txt
call msgbox "Update Successful!\n\nNote: Settings have been reset"  "0+64" "Information"
start /min "" "Run.bat"
exit