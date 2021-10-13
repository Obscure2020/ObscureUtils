@echo off
yt-dlp -U
pushd %temp%
mkdir ytd
cd ytd
echo. > listing.txt
del listing.txt
echo Best YTD
echo ==============================
echo.
set counter=1
:loop
set input=
set /p input="Youtube URL #%counter%: "
set /a counter=%counter%+1
if not "%input%" equ "" echo %input% >> listing.txt
if not "%input%" equ "" goto loop
rmdir /s /q videos
mkdir videos
cd videos
for /f "tokens=*" %%u in (..\listing.txt) do (
    yt-dlp -N 5 --merge-output-format mkv --format-sort codec --embed-thumbnail --embed-metadata "%%u"
    move .\* "%userprofile%\desktop"
)
yt-dlp --rm-cache-dir
cd %temp%
rmdir /s /q ytd
popd