#!/bin/bash

echo -n "Small files:"
for file in *
do 
	if [[ $(wc -l $file | cut -d' ' -f1) -lt 10 ]]
		then echo -n " "$file
	fi
done
echo \

echo -n "Medium-sized files:"
for file in *
do 
	if [[ $(wc -l $file | cut -d' ' -f1) -ge 10 && $(wc -l $file | cut -d' ' -f1) -lt 100 ]]
		then echo -n " "$file
	fi
done
echo \

echo -n "Large files:"
for file in *
do 
	if [[ $(wc -l $file | cut -d' ' -f1) -gt 100 ]]
		then echo -n " "$file
	fi
done
echo \