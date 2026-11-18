@echo off
setlocal DisableDelayedExpansion
title Delete MyPura

rem Delete only MyPura in the current user's Local AppData.
rem No PowerShell, encoded commands, hidden windows, or automatic elevation.
if not defined LOCALAPPDATA (
    echo ERROR: LOCALAPPDATA is not set.
    pause
    exit /b 1
)

set "target=%LOCALAPPDATA%\Programs\MyPura"
if not exist "%target%" (
    echo MyPura folder does not exist:
    echo "%target%"
    pause
    exit /b 0
)

echo Deleting:
echo "%target%"
echo.
rd /s /q "%target%"

if exist "%target%" (
    echo.
    echo ERROR: Could not completely delete MyPura.
    echo Close MyPura and try again.
    echo If access is denied, right-click this script and select Run as administrator.
    pause
    exit /b 1
)

echo.
echo MyPura deleted successfully.
pause
exit /b 0
