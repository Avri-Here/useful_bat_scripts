@echo off
setlocal

:loop
cls

REM Get the current date and time
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set hour=%%a
    set minute=%%b
    set second=%%c
    set centisecond=%%d
)

set day=%date:~0,2%
set month=%date:~3,2%
set year=%date:~6,4%

REM Center the output
set "spaces=                                               "
set "line1=%spaces% Current Date and Time %spaces%"
set "line2=%spaces% Date: %day%-%month%-%year% %spaces%"
set "line3=%spaces% Time: %hour%:%minute%:%second%.%centisecond% %spaces%"
set "line4=%spaces%=========================================%spaces%"

REM Print styled current date and time
echo.
echo %line4:~0,80%
echo %line1:~0,80%
echo %line4:~0,80%
echo %line2:~0,80%
echo %line3:~0,80%
echo %line4:~0,80%

REM Wait for 1 second before updating
ping localhost -n 2 >nul

goto loop
