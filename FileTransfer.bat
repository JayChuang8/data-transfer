@echo off
title Copy Files

setlocal disableDelayedExpansion
set "count=0"
setlocal enableDelayedExpansion


:SourceInput
set "source=C:\Users\chuangja\Desktop\Work\Transfer\Test1 C:\Users\chuangja\Desktop\Work\Transfer\Test2
(set parsed=!source: =^
%= Don't remove this line =%
!)
for /f "eol= delims= " %%A in ("!parsed!") do (
	if "!" equ "" endlocal
	set /a count+=1
	setlocal enableDelayedExpansion
	for %%N in (!count!) do (
		endlocal
		set array[%%N]=%%A
	)
)
setlocal enableDelayedExpansion


:DestInput
set "dest=C:\Users\chuangja\Documents"
if exist "!dest!" goto Copy
echo Error: The specified destination does not exist.
goto DestInput


:Copy
for /l %%N in (1 1 !count!) do (
	set "sourcepath=!array[%%N]!"
	for %%i in (!sourcepath!) do set finalfolder=%%~nxi
	set "newdest=%dest%\!finalfolder!"
	xcopy !array[%%N]! !newdest! /E /H /I /S
)


:end
pause