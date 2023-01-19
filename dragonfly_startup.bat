@echo off
rem copy this file to C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\ (braucht Adminrechte)
rem better in d:\all\dragonfly\

rem  determine whether someone is logged in via remotedestop
rem quser
rem  BENUTZERNAME          SITZUNGSNAME       ID  STATUS  LEERLAUF   ANMELDEZEIT
rem >thorgil.eisenhand     rdp-tcp#10          5  Aktiv           .  07.09.2021 17:58
rem quser|findstr "rdp-tcp"

rem tasklist /FO CSV |findstr /I dragon

rem taskkill /F /IM dragonfly_main.exe
rem taskkill /F /IM Dragonfly.exe

rem runas /user:mcl\thorgil.eisenhand "bla.bat \"blub\""

rem username ins controlfie per bat von unser rein, hier warten bis ausgeloggt, dann runas, user kann wieder einloggen nach Xsekunden, selbes bat zum starten
rem CALL Ruft eine Batchdatei von einer anderen Batchdatei aus auf.

rem WS restart shutdown -r -t 10

:userabfrage
for /f "tokens=1,2* delims=> " %%i in ('quser^|findstr "rdp-tcp"') do set %username%=%%i
rem echo %username%
rem -----------------------------------------------------------------------------------------------------------------
:ifuser
if not %username% == "" (
rem message to user waiting for 
msg /V /TIME:0 %username% "please log out from current remote session to allow dragonfly to be restarted")
goto forloop 
rem -----------------------------------------------------------------------------------------------------------------
rem dragonfile starten
if %username% == "" call d:\Johanna\dragonfly\dragon.bat


rem d:\Johanna\dragonfly\dragon.bat /start-loop



