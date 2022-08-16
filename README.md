# ObscureUtils
This project began as a collection of Batch scripts I made to sit on my Windows desktop to be called upon when I needed them. Their primary functions are **downloading online media**, **converting audio**, and **playing media files**. Over time, the list of scripts grew, their capabilities improved, their dependencies changed, and I rewrote how they worked a few times. One especially motivating factor in improving the scripts was when my younger brother requested copies for himself. Until that point, the scripts were not designed to work on any system other than my own.\
\
I rewrote my scripts so that they operated in `%temp%` rather than in preexisting folders on my machine, called programs from `%path%` rather than by explicit locations, and located the desktop using `%userprofile%`. Then I realized I made a few mistakes, and fixed them. And then I went to college, realized I made a few more mistakes, and needed to send new copies to my brother via Discord. And then I realized I made a few *more* mistakes. Time to put the scripts on GitHub already and do this properly!

## Dependencies
Make sure these programs are accessible through your system's `path` variable for the scripts to work.
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) (since pre-Github, replaced [youtube-dl](https://github.com/ytdl-org/youtube-dl))
- [ffmpeg](http://ffmpeg.org/) (since pre-GitHub)
- [lame](https://lame.sourceforge.io/index.php) (since pre-GitHub)
- ffplay (since pre-Github, should come with ffmpeg. **Windows only.**)

## To-Do (in descending order of likelihood)
1. Make new versions of the scripts that work on Linux and Mac. _**Update:** Work has actually begun on this one!_
1. Windows's CMD has trouble with some text input, most notably with the `&` symbol. I'd like to fix this, possibly by converting my `.bat` scripts to `.ps1` scripts.
1. Write usage guides for each of the scripts.
1. Write installation guides for Windows, Linux, and Mac.
