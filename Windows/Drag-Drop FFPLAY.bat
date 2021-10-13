@echo off
:loop
if not exist "%~1" exit
cd "%userprofile%\desktop"
cd ffmpeg*
cd bin
cls
ffplay -hide_banner -fs -autoexit -fast "%~1"
shift
goto loop