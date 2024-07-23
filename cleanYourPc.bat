
@REM @echo off
@REM :: BatchGotAdmin
@REM ::-------------------------------------
@REM REM  --> Check for permissions
@REM >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

@REM REM --> If error flag set, we do not have admin.
@REM if '%errorlevel%' NEQ '0' (
@REM     echo Requesting administrative privileges...
@REM     goto UACPrompt
@REM ) else (
@REM     goto gotAdmin
@REM )

@REM :UACPrompt
@REM     echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
@REM     set "params=%*"
@REM     echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

@REM     "%temp%\getadmin.vbs"
@REM     del "%temp%\getadmin.vbs"
@REM     exit /B

@REM :gotAdmin
@REM     pushd "%CD%"
@REM     CD /D "%~dp0"
@REM ::--------------------------------------

@REM ::ENTER YOUR CODE BELOW:
@REM @REM pause

@REM setlocal enabledelayedexpansion

@REM set "directories=C:\Windows\Temp C:\Users\avrahamy\AppData\Local\Temp C:\Windows\Prefetch"

@REM for %%D in (%directories%) do (
@REM     echo Processing %%D
@REM     deldir "%%D\*" >nul 2>&1
@REM     pause
   
@REM )

@REM echo Cleanup complete.
@REM pause


@echo off
:: Batch script to delete temp files
:: Run this script as an administrator

:checkPrivileges
REM Check if the script is running with administrator privileges
net session >nul 2>&1
if '%errorlevel%' NEQ '0' (
    echo Requesting administrator privileges...
    goto getPrivileges
) else ( goto mainScript )

:getPrivileges
REM Requesting administrator privileges
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getAdmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""%~f0""", "", "runas", 1 >> "%temp%\getAdmin.vbs"
"%temp%\getAdmin.vbs"
del "%temp%\getAdmin.vbs"
exit /B

:mainScript
REM The main script logic
setlocal enabledelayedexpansion

@REM set "directories=C:\Windows\Temp C:\Users\avrahamy\AppData\Local\Temp C:\Windows\Prefetch"
set "directories=C:\Windows\Temp %USERPROFILE%\AppData\Local\Temp C:\Windows\Prefetch"
for %%D in (%directories%) do (
    echo Processing %%D
    for /r %%F in ("%%D\*") do (
        del "%%F" >nul 2>&1
        if '%errorlevel%' NEQ '0' (
            echo Error deleting %%F, skipping...
        )
    )
)

echo Cleanup complete.
pause
exit /B
