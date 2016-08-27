#!/bin/bash
var=$1
regex="^[0-9]+$"
if [ $# -ne 2 ]   
then echo "Usage: ./echon.sh <number of lines> <string>"
exit
elif ! [[ $var =~ $regex ]]
then echo "./echon.sh: argument 1 must be a non-negative integer"
exit
elif [ $var -lt 0 ] 
then echo "./echon.sh: argument 1 must be a non-negative integer"
exit
fi

while [ $var -ne 0 ]
do
	echo "$2"
	var=`expr $var - 1`
done
