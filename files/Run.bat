@echo off
reg add HKCU\Console /v QuickEdit /t REG_DWORD /d 0 /f
start "" "CAIE_PastPaperOpener"