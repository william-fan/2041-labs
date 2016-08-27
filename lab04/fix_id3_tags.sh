#!/bin/bash

for file in "$@" #look at folders
do
	for song in "$file"/* #look at files
	do
		track=`echo "$song" |  egrep -o "/[0-9]+" | cut -c2-`  
		title=`echo "$song" | egrep -o "\- .+ \-" | sed s/\-\ // | sed s/\ \-//`
		artist=`echo "$song" | egrep -o "(\-)+ .+\.mp3" | sed s/"$title"// | sed s/\-\ // | sed s/\ \-// | cut -c2- | sed s/\.mp3//`
		album=`echo "$song" | egrep "/.*," | cut -d'/' -f2`
		year=`echo "$album" | tail -c5` 
		#echo "$track - $title - $artist - $album - $year"
		id3 -t "$title" -T "$track" -a "$artist" -A "$album" -y "$year" "$song" > /dev/null #change id3 tags
	done
done
