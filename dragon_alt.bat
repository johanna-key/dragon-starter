@echo off
rem ---------------------------------------------------------------------------
set LOG_FILE="D:\Johanna\dragonfly\dragonloop.log"
set CONTROL_FILE="D:\Johanna\dragonfly\start_dragonfile"
set STOP_LOOP_FILE="D:\Johanna\dragonfly\stop_dragonfile_loop"
rem ---------------------------------------------------------------------------
if "%1" == "/help" goto :help
if "%1" == "/start-loop" goto :looper
if "%1" == "/stop-loop" goto :stoploop
if "%1" == "/start" goto :startfilegenerator
goto help
rem ---------------------------------------------------------------------------
:help
echo %0 /help           this help
echo %0 /start-loop     start the loop
echo %0 /stop-loop      stop  the loop
echo %0 /start          start dragonfly
goto end
rem ---------------------------------------------------------------------------
:looper
echo Loop for starting dragonfly: generate file named %CONTROL_FILE% to start an instance.
echo (generate %STOP_LOOP_FILE% to stop loop e.g. by calling with /stop-loop)
goto loop
rem ---------------------------------------------------------------------------
:stoploop
echi i am in stoploop
echo stopme > %STOP_LOOP_FILE%
goto end
rem ---------------------------------------------------------------------------
:loop
echo i am in loop

if exist %CONTROL_FILE% (
echo starting dragonfly instance...
rem date /t >> %LOG_FILE%
rem echo starting dragonfly instance... >> %LOG_FILE%
del %CONTROL_FILE%
c:
cd "C:\"Program Files"\Dragonfly"
c:"C:\"Program Files"\Dragonfly\Dragonfly.exe"
)
timeout /t 10 /nobreak
if exist %STOP_LOOP_FILE% goto :endloop
echo i am in goloop

goto loop
rem ---------------------------------------------------------------------------
:endloop
echo Loop for starting dragonfly ended by user request.
rem echo Loop for starting dragonfly ended by user request. >> %LOG_FILE%
del %STOP_LOOP_FILE%
rem ---------------------------------------------------------------------------
:startfilegenerator
echo i am in filegenerator

echo start > %CONTROL_FILE%
goto end
rem ---------------------------------------------------------------------------
:end
rem ---------------------------------------------------------------------------
rem End