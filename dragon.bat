@echo off
rem ---------------------------------------------------------------------------
set LOG_FILE=D:\Johanna\dragonfly\dragonloop.log
set CONTROL_FILE=D:\Johanna\dragonfly\start_dragonfile
set STOP_LOOP_FILE=D:\Johanna\dragonfly\stop_dragonfile_loop
rem ---------------------------------------------------------------------------
if "%1" == "/help" goto help
if "%1" == "/start-loop" goto looper
if "%1" == "/stop-loop" goto stoploop
if "%1" == "/start" goto startfilegenerator
goto help
rem ---------------------------------------------------------------------------
:help
echo %0 /help           this help
echo %0 /start-loop     start the loop
echo %0 /stop-loop      stop  the loop
echo %0 /start          start dragonfly
echo.
echo.
echo Notizen
echo ^^^^^^^
echo * u.U.  shutdown /r  um zu booten
echo * Ein AutoStart in C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\ anlegen?
goto end
rem ---------------------------------------------------------------------------
:looper
echo Loop for starting dragonfly: call  %0 /start  to start an instance.
echo (call  %0 /stop-loop  to stop the loop)
goto loop
rem ---------------------------------------------------------------------------
:stoploop
echo stopme > %STOP_LOOP_FILE%
goto end
rem ---------------------------------------------------------------------------
:loop
if exist %CONTROL_FILE% (
echo starting dragonfly instance...
date /t >> %LOG_FILE%
timeout /t 10 /nobreak
echo starting dragonfly instance... >> %LOG_FILE%
echo 
del %CONTROL_FILE%
c:
cd C:\"Program Files"\Dragonfly\
C:\"Program Files"\Dragonfly\Dragonfly.exe
)
timeout /t 10 /nobreak
if exist %STOP_LOOP_FILE% goto endloop
goto loop
rem ---------------------------------------------------------------------------
:endloop
echo Loop for starting dragonfly ended by user request.
echo Loop for starting dragonfly ended by user request. >> %LOG_FILE%
del %STOP_LOOP_FILE%
goto end
rem ---------------------------------------------------------------------------
:startfilegenerator
echo start > %CONTROL_FILE%
goto end
rem ---------------------------------------------------------------------------
rem ergänzt 9.9.2021 prüfen bitte
:call_username_from_starterfile
call d:\Johanna\dragonfly\dragonfly_startup.bat %username%
goto end
rem ---------------------------------------------------------------------------
:end
rem ---------------------------------------------------------------------------
rem End
