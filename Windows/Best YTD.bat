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
    yt-dlp -N 4 -S quality,codec -f bv+ba/b -o "%%(title).160s [%%(id).40s].%%(ext)s" -R 30 --file-access-retries 30 --fragment-retries 30 --merge-output-format mkv --embed-thumbnail --embed-metadata "%%u"
    move .\* "%userprofile%\desktop"
)
yt-dlp --rm-cache-dir
cd %temp%
rmdir /s /q ytd
popd