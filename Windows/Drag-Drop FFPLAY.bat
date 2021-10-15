@echo off
:loop
if not exist "%~1" exit
cls
ffplay -hide_banner -fs -autoexit -fast "%~1"
shift
goto loop