@echo off
title Activate Windows 11 (ALL versions)
cls
echo =====================================================================================
echo                           Activating Windows 11
echo =====================================================================================
echo.
echo #Supported products:
echo - Windows 11 Home
echo - Windows 11 Professional
echo - Windows 11 Education
echo - Windows 11 Enterprise
echo.
echo.

cscript //nologo slmgr.vbs /ckms >nul
cscript //nologo slmgr.vbs /upk >nul
cscript //nologo slmgr.vbs /cpky >nul

wmic os | findstr /I "enterprise" >nul
if %errorlevel% EQU 0 (
    cscript //nologo slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul
    goto setkms
) 

wmic os | findstr /I "home" >nul
if %errorlevel% EQU 0 (
    cscript //nologo slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul
    goto setkms
) 

wmic os | findstr /I "education" >nul
if %errorlevel% EQU 0 (
    cscript //nologo slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul
    goto setkms
) 

wmic os | findstr /I "11 pro" >nul
if %errorlevel% EQU 0 (
    cscript //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul
    goto setkms
) 

goto notsupported

:setkms
REM Set the KMS server to 107.175.77.7
cscript //nologo slmgr.vbs /skms 107.175.77.7:1688 >nul

:ato
echo =====================================================================================
echo.
echo.
cscript //nologo slmgr.vbs /ato | find /i "successfully" && (
    echo.
    echo =====================================================================================
    echo Windows activation successfull.
    echo =====================================================================================
    
    REM Show message box notifying user of successful activation
    mshta "javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('Windows 11 activated successfully! :)', 0, 'Activation Status', 64);close();"
    
    goto delete_self

) || (
    echo The connection to the KMS server failed! Please try again later.
)

goto halt

:notsupported
echo =====================================================================================
echo Sorry, your version is not supported.
echo =====================================================================================
goto halt

:delete_self
echo Script will now delete itself...
start "" cmd /c del "%~f0"
exit

:halt
pause
