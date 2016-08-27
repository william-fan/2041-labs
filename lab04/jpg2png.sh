#!/bin/bash

for file in *.jpg
do 
	name=`echo $file | sed s/\.jpg//` #remove jpg from file name
	if	[[ "$name.png" == $(ls | egrep "$name\.png") ]] #check if file names already exist
	then
		echo "$name.png already exists"
	else 
		`convert "$file" "$name.png"`	#convert
		rm "$file"
	fi
done
