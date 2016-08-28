#!/bin/bash

#song="$2"
#foldername="$1"

#wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw'

#mkdir "$1"

song=`wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw' | egrep "Triple J Hottest 100, [0-9]{4}\|[0-9]{4}" -A 12`
album=`wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw' | egrep -o "Triple J Hottest 100, [0-9]{4}" | tail -n+4`

for folders in "$album"
do 
	#echo "$album"
	list=`wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw' | egrep "$album\|[0-9]{4}" -A 12 | cut -c2- | sed '/^$/d' | sed 's/^ style=.*//'`
	#| sed s/"\[\["// | sed s/\"// | sed s/"\]\]"// | sed '/^$/d' | sed '/^-$/d' | sed "$album"
	echo "$list"
	#mkdir "$folder"
	#for songs in "$folder"
	#do 
	#	cp "$2" "$song"
	#done
done
