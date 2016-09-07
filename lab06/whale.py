#!/usr/bin/python
import string
import sys
total = []
count = 0
pod = 0

for line in sys.stdin:
	total.append(line) #push input into array

for arg in total:
	arg.strip()
	number, animal = arg.split(" ", 1) 		#split input into two

	if sys.argv[1].strip() == animal.strip():
		count += int(number) 	#add to count of individuals
		pod += 1				#add to count of pod


print ("%s observations: %s pods, %s individuals" % (sys.argv[1], pod, count))