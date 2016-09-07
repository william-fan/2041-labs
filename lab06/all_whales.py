#!/usr/bin/python
import re
import sys
import string

total = []
edit = []
list = []
sort = []
count = 0
pod = 0
temp = 0

for line in sys.stdin:
	total.append(line) #push input into array

for arg in total:
	a = arg.lower()
	temp = 0	#flag if animal already exists
	a.strip()
	a = re.sub("\s+$","",a)
	a = re.sub("\s+", " ",a)		#remove whitespace and trailing s
	a = re.sub("s$", " ",a)
	#ya = re.sub("  ", " ", a)
	edit.append(a)
	#print lc($arg);
	array = a.split()
	number = int (array.pop(0))
	animal = " ".join(array)
	#(number, animal) = a.split(" ", 1)  #split input into two
	#print "$animal|";
	for type in list:
		if (type == animal):	#check if animal exists in list
			temp = 1
		
	
	if (temp == 0):
		list.append(animal) #add list to list of species
	

for species in list:	#loop through species
	count = 0
	pod = 0
	for arg in edit:	#loop through edited stdin
		arg.strip()
		array = arg.split()
		number = int (array.pop(0))
		animal = " ".join(array)
		#(number, animal) = arg.split(" ", 1)		
		if (species == animal):
			count += int(number)		#add to final count
			pod += 1
	
		#print "$arg|";
	
	sort.append(str(species)+" observations: " + str(pod)+" pods, "+str(count)+" individuals")	


sort.sort()	#sort output

for arg in sort:
	print arg

