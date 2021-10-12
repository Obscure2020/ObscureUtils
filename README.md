# ObscureUtils
This project began as a collection of Batch scripts I made to sit on my Windows desktop to be called upon when I needed them. Over time, the list of scripts grew, their capabilities improved, their dependencies changed, and I rewrote how they worked a few times. One especially motivating factor in improving the scripts was when my younger brother requested copies for himself. Until that point, the scripts were not designed to work on any system other than my own.\
\
I rewrote my scripts so that they operated in `%temp%` rather than in preexisting folders on my machine, and called programs from `%path%` rather than by explicit locations. And then I realized I made a few mistakes, and fixed them. And then I went to college, realized I made a few more mistakes, and needed to send new copies to my brother via Discord. And then I realized I made a few *more* mistakes. Time to put the scripts on GitHub already and do this properly!

## Dependencies
- yt-dlp (since v3, replaced youtube-dl)
- ffplay (since v2)
- lame (since v1)
- ffmpeg (since v1)

## Changelog
**The project was moved to GitHub here.**\
v3 - I chose to use yt-dlp instead of youtube-dl due to the former's saner defaults (especially in format preference sorting) and more active maintainers.\
v2 - `Best Audio YTD` and `Drag-Drop FFPLAY`\
v1 - Original `Best YTD`, `MP3 YTD`, `Drag-Drop WAV`, and `Drag-Drop MP3` created.
