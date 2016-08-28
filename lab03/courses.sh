#!/bin/bash

var=$1	#input subject code
first=`echo $var | cut -c1`	#first character of subject

under=`wget -q -O- "http://www.handbook.unsw.edu.au/vbook2016/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr="$first | grep -o $var[0-9]*.html.*| sed "s/.html\">/ /" | sed "s/<\/A><\/TD>//" | sed "s/\s*$//"`
#undergrad output
#search for subject[numbers].html, then remove .html and tags and trailing spaces.
post=`wget -q -O- "http://www.handbook.unsw.edu.au/vbook2016/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr="$first | grep -o $var[0-9]*.html.*| sed "s/.html\">/ /" | sed "s/<\/A><\/TD>//" | sed "s/\s*$//"`

if [[ "$under" == "" ]] #if undergrad is empty
then 
	echo -e "$under\n$post" | sort -n | uniq | tail -n +2 #remove the first line, as we add a newline after under
else
	echo -e "$under\n$post" | sort -n | uniq 
fi
