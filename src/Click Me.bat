@echo off
SET SCRIPT="%TEMP%\%random%-%random%-%random%-%random%.vbs"
(
	ECHO Set oWS = WScript.CreateObject^("WScript.Shell"^)
	ECHO sLinkFile = "..\CAIE PastPaperOpener.lnk"
	ECHO Set oLink = oWS.CreateShortcut^(sLinkFile^)
	ECHO oLink.TargetPath = "%cd%\files\Run.bat"
	ECHO oLink.WorkingDirectory = "%cd%\files"
	ECHO oLink.IconLocation = "%cd%\files\ICON.ico"
	ECHO oLink.WindowStyle = 7
	ECHO oLink.Save
) > %SCRIPT%
CSCRIPT /nologo %SCRIPT%
DEL %SCRIPT%
del %0
