#!/usr/bin/python
import string
import sys
files = []
number = 10 #default number of lines shown
count = 0 #stores number

for arg in sys.argv[1:]:
	files.append(arg)	
	#print arg

for f in files:
	number = 10
	count = 0
	for line in open(f):
		count += 1
	if (count - number < 0):
		number = 0
	else:
		number = count - number
		
	for line in open(f):
		if (number <= 0):
			print line,
		number -=1
	print 
  


