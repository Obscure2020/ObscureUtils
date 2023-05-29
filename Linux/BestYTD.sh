#!/bin/bash

#Please modify this variable to your desired output destination.
DESTINATION="$HOME/Desktop"

yt-dlp -U
YTDTEMP=$(mktemp -dt)
cd $YTDTEMP
echo "Best YTD"
echo -e "==============================\n"
counter=1
while :
do
    read -r -p "Youtube URL #$((counter++)): " YTDURL
    if [ -z "$YTDURL" ]
    then
        break
    fi
    echo $YTDURL >> listing.txt
done
mkdir videos
cd videos
for LINE in $(cat "../listing.txt")
do
    yt-dlp -N 8 -S quality,codec -f bv+ba/b -o "%(title).160s [%(id).40s].%(ext)s" -R 30 --file-access-retries 30 --fragment-retries 30 --merge-output-format mkv --embed-thumbnail --embed-metadata "$LINE"
    mv ./* "$DESTINATION"
done
yt-dlp --rm-cache-dir
cd ~
rm -r $YTDTEMP
