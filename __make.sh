#!/bin/bash

# concatenate all .mov files in folder 
# https://trac.ffmpeg.org/wiki/Concatenate
# export movies from keynote as 10,0,1080p

IN="a-new-program"
OUT="_a-new-program"

# read filenames write list
# files read alphabetically (use finder to rename sequence)
for f in ./*.m4v
    do echo "file '$f'" >> _list.txt
done

# concat
ffmpeg -f concat -safe 0 -i _list.txt -c copy $OUT.m4v

# speedup 60x
ffmpeg -i $OUT.m4v -filter:v "setpts=PTS/60" _tmp.m4v

# add audio
# sox $IN.mp3 _tmp.mp3 repeat 20 
# ffmpeg -i _tmp.m4v -i $IN.mp3 -shortest $OUT.mov
# ffmpeg -i _tmp.m4v -i $IN.mp3 $OUT.mov
ffmpeg -i _tmp.m4v -i $IN.mp3 -c copy -map 0:v:0 -map 1:a:0 -shortest $OUT.mov

# cleanup 
rm _list.txt
rm _tmp.*
rm $OUT.m4v
open $OUT.mov

echo "** written to $OUT.mov **"
wc -c $OUT.mov
echo "done."

exit
