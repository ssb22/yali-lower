@echo off

if exist gradint-wrapper.exe goto alreadyInRightDir

rem find where gradint is
if not exist "%HOMEDRIVE%%HOMEPATH%" set HOMEDRIVE=C:
if not exist "%HOMEDRIVE%%HOMEPATH%" set HOMEPATH="\Program Files"
if not exist "%USERPROFILE%" set USERPROFILE="C:\WINDOWS"

if not exist "%HOMEDRIVE%%HOMEPATH%\gradint" mkdir "%HOMEDRIVE%%HOMEPATH%\gradint"
rem (allow install before gradint is installed)

if exist "%HOMEDRIVE%%HOMEPATH%\gradint\partials" goto copy
rem see if we have the XP general directory-move command (probably won't work on 95 or Vista)
move partials "%HOMEDRIVE%%HOMEPATH%\gradint\partials"
if errorlevel 1 goto copy
goto alreadyInRightDir
:copy
xcopy /Y partials "%HOMEDRIVE%%HOMEPATH%\gradint\partials\" /S
rmdir partials /S /Q
:alreadyInRightDir
rem restart gradint
tskill gradint-wrapper 2>nul
taskkill /f /im gradint-wrapper.exe 2>nul >nul
pushd "%HOMEDRIVE%%HOMEPATH%\gradint"
if exist gradint-wrapper.exe start gradint-wrapper.exe once_per_day=2
popd
:end
del setup.bat
