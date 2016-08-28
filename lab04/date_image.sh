#!/bin/bash

picture="$1" 
cp -p "$picture" "$$.jpg" #create copy of image
time=`ls -l "$picture" | egrep -o "[A-Z][a-z][a-z]( )+[0-9]+( )+[0-9:]+"` #search for time 
`convert -gravity south -pointsize 36 -draw "text 0,10 '$time'" "$1" "$1"` #add time to image
touch -r "$$.jpg" "$picture" #copy old time modified
rm "$$.jpg" #remove copy