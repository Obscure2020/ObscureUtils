@echo off
:loop
if not exist "%~1" goto end
cls
ffplay -hide_banner -fs -autoexit -fast "%~1"
shift
goto loop
:end