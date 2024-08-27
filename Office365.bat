@echo off
title Activate Office 365 ProPlus
cls
echo =====================================================================================
echo                           Activating Office 365 ProPlus
echo =====================================================================================
echo.
echo #Supported products:
echo - Office 365 ProPlus (x86-x64)
echo.
echo.
(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16") ^
 || (if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")
(for /f %%x in ('dir /b "..\root\Licenses16\proplusvl_kms*.xrm-ms"') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)

echo =====================================================================================
echo Activating your product...
cscript //nologo ospp.vbs /setprt:1688 >nul
cscript //nologo ospp.vbs /unpkey:WFG99 >nul
cscript //nologo ospp.vbs /unpkey:DRTFM >nul
cscript //nologo ospp.vbs /unpkey:BTDRB >nul
cscript //nologo ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul || goto notsupported

REM Set the KMS server to 107.175.77.7
cscript //nologo ospp.vbs /sethst:107.175.77.7 >nul

:ato
echo =====================================================================================
echo.
echo.
cscript //nologo ospp.vbs /act | find /i "successful" && (
    echo.
    echo =====================================================================================
    echo Product activation successful.
    echo =====================================================================================
    
    REM Show message box notifying user of successful activation
    mshta "javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('Office 365 ProPlus activated successfully! :)', 0, 'Activation Status', 64);close();"
    
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
