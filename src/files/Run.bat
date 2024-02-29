@echo off
reg add HKCU\Console /v QuickEdit /t REG_DWORD /d 0 /f
start conhost -- "CAIE_PastPaperOpener.bat"
exit
