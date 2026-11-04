@echo off
chcp 65001 >nul

:: 1. Rechten controleren (Privilege Check)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Fout: Start dit script als Administrator!
    pause
    exit /b 1
)

echo Starten met het herstellen van de Windows Installer (msiserver)...
echo.

:: 2. Opstarttype wijzigen naar Handmatig (Demand)
echo [1/3] Opstarttype instellen op Handmatig (Demand)...
sc config msiserver start= demand

:: 3. Service starten
echo [2/3] Service starten...
net start msiserver

:: 4. Engine de-registreren en opnieuw registreren
echo [3/3] msiexec engine herregistreren...
msiexec /unregister
msiexec /regserver

echo.
echo Succes: Windows Installer is succesvol hersteld!
pause