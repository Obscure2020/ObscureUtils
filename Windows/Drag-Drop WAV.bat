@echo off
:loop
if not exist "%~1" exit
cd "%~dp1"
if not exist "%~n1".wav ffmpeg -hide_banner -i "%~1" -map_metadata -1 -c:a pcm_f32le "%~n1".wav
shift
goto loop