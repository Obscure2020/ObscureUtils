@echo on
:loop
if not exist "%~1" exit
cd %temp%
rmdir /s /q slam
mkdir slam
cd slam
copy "%~1" "%~nx1"
if not exist "%~n1".wav ffmpeg -hide_banner -i "%~nx1" -map_metadata -1 -c:a pcm_f32le "%~n1".wav
lame -q 0 -b 320 --cbr --replaygain-accurate "%~n1".wav
move "%~n1".mp3 "%~dp1"
cd %temp%
rmdir /s /q slam
shift
goto loop