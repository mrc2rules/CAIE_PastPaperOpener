@echo off
::===Console Virtual Terminal Sequences List===
:VT100
::Reset
set rst=[0m
set tRST=[39m
set bRST=[49m
::Text Formatting
::Text Reset, Red, Green, Yellow, Orange, Intensity, Underline, Italics, Text Highlight
set tRED=[38;5;167m
set tGRN=[38;5;29m
set tYLW=[38;5;228m
set tORG=[38;5;215m
set int=[1m
set und=[4m
set it=[3m
set THL=[38;5;159m
::Background Formatting
::Highlight, Gray, Dark Red, Dark Green
set HL=[48;5;234m
set gray=[48;5;240m  
set dRED=[48;5;88m
set dgrn=[48;5;29m
goto :eof