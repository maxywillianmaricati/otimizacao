@echo off
chcp 65001 >nul


net session >nul 2>&1
if %errorlevel% == 0 (
    goto :MENU
) else (
    goto :ADMIN
)
cls

:ADMIN
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:MENU
cls
mode con: cols=75 linhas=28
color 0B
echo =========================================================================
echo ^|                                                                       ^|
echo ^|    - MENU !                                                           ^|
echo ^|                                                                       ^|
echo ^|    [1] ATIVAR PACOTE OFFICE/WINDOWS                                   ^|
echo ^|    [2] LIMPAR ARQUIVOS TEMPORARIOS                                    ^|
echo ^|    [3] OTIMIZAR INPUT LAG                                             ^|
echo ^|    [4] OTIMIZAR MEMORIA                                               ^|
echo ^|                                                                       ^|
echo =========================================================================
echo.
echo                                              © made by:
echo                                              maxywillianmaricati on github 
echo                                              last update: 22-05-2026
echo.


set /p opcao=OPCAO : 

if "%opcao%"=="1" goto :MENU_ATIVACAO
if "%opcao%"=="2" goto :LIMPEZA
if "%opcao%"=="3" goto :INPUTLAG
if "%opcao%"=="4" goto :MEMORIA

echo OPCAO INVALIDA!
pause
cls
goto :MENU

:MENU_ATIVACAO
cls
echo ==============================================
echo ^|                                          ^|
echo ^|                ATIVACAO                  ^|
echo ^|                                          ^|
echo ==============================================
echo.

echo Abrindo o ativador no PowerShell...
echo Aguarde a nova janela carregar.
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"

echo.
cls
goto :MENU

:LIMPEZA
cls
echo APAGANDO LIXO DO SISTEMA...

echo [1/3] PASTA TEMP DO USUARIO(CACHE DO USUARIO)
del /f /s /q "%temp%\*.*" >nul 2>nul
rmdir /s /q "%temp%" >nul 2>nul
mkdir "%temp%" >nul 2>nul

echo [2/3] PASTA TEMP DO WINDOWS(CACHE DO WINDOWS)
del /f /s /q "C:\Windows\Temp\*.*" >nul 2>nul
rmdir /s /q "C:\Windows\Temp" >nul 2>nul
mkdir "C:\Windows\Temp" >nul 2>nul

echo [3/3] PASTA PREFETCH(CACHE DO WINDOWS)
del /f /s /q "C:\Windows\Prefetch\*.*" >nul 2>nul
rmdir /s /q "C:\Windows\Prefetch" >nul 2>nul
mkdir "C:\Windows\Prefetch" >nul 2>nul

echo.
echo                    CONCLUIDO!
echo.
pause
goto :MENU

:INPUTLAG
cls
echo.
echo [!] APLICANDO OTIMIZAÇÕES NO REGISTRO...
echo.
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t REG_SZ /d "200" /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t REG_SZ /d "15" /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "59" /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t REG_DWORD /d 1000 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d 4294967295 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d 3 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d 32 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f >nul
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "000000000000000000CC0C0000000000809919000000000040662600000000000033330000000000" /f >nul
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000000038000000000000007000000000000000A800000000000000E00000000000" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 20 /f >nul

echo [!] REINICIANDO O EXPLORER PARA APLICAR AS ALTERAÇÕES...
echo                         CONCLUIDO!


taskkill /f /im explorer.exe >nul 2>nul
explorer.exe

pause
goto :MENU

:MEMORIA
echo.
echo OTIMIZANDO MEMORIA...

echo.
echo [1/3] DESTIVANDO SYSMAIN
sc config SysMain start= disabled
echo [2/3] MELHORANDO A EFICIENCIA...
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f
echo [3/3] APRIMORANDO A RAM
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f

echo.
echo         [!] REINICIE O PC PARA APLICAR TUDO!
echo.
pause
echo.
goto :MENU