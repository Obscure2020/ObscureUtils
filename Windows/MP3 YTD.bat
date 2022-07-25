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
mkdir outputs
for /f "tokens=*" %%u in (..\listing.txt) do (
    yt-dlp -N 4 -S acodec -f "bestaudio/bestaudio*" -R 30 --file-access-retries 30 --fragment-retries 30 --merge-output-format mkv "%%u"
    cd outputs
    for %%j in (..\*) do (
        ffmpeg -hide_banner -i "..\%%~nxj" -map_metadata -1 -c:a pcm_f32le "%%~nj".wav
        del "..\%%~nxj"
        lame -q 0 -b 320 --cbr --replaygain-accurate "%%~nj".wav
    )
    move *.mp3 "%userprofile%\desktop"
    del *.wav
    cd ..
)
cd %temp%
rmdir /s /q ytd
yt-dlp --rm-cache-dir
popd