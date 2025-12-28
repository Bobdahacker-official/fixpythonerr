@echo off
title Enable Windows Long Paths
color 0a

echo ================================
echo Enabling Win32 Long Path Support
echo ================================
echo.

:: Check for admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Run this script as Administrator!
    pause
    exit /b
)

:: Enable long paths
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" ^
/v LongPathsEnabled /t REG_DWORD /d 1 /f

if %errorLevel% equ 0 (
    echo.
    echo SUCCESS: Long paths have been enabled!
    echo A reboot is REQUIRED.
) else (
    echo.
    echo FAILED: Could not update registry.
)

echo.
pause
