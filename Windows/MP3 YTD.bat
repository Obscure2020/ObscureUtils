@echo off
yt-dlp -U
pushd %temp%
mkdir ytd
cd ytd
echo. > listing.txt
del listing.txt
echo MP3 YTD 
echo ==============================
echo.
set counter=1
:loop
set input=
set /p input="Youtube URL #%counter%: "
set /a counter=%counter%+1
if not "%input%" equ "" echo %input% >> listing.txt
if not "%input%" equ "" goto loop
rmdir /s /q audios
mkdir audios
cd audios
for /f "tokens=*" %%u in (..\listing.txt) do (
    yt-dlp -N 5 --format-sort acodec -f "bestaudio/bestaudio*" "%%u"
)
yt-dlp --rm-cache-dir
mkdir outputs
cd outputs
for %%u in (..\*) do (
    ffmpeg -hide_banner -i "..\%%~nxu" -c:a pcm_f32le "%%~nu".wav
)
for %%u in (*.wav) do (
    lame -q 0 -b 320 --cbr --replaygain-accurate "%%~nxu"
    move *.mp3 "%userprofile%\desktop"
)
cd %temp%
rmdir /s /q ytd
popd