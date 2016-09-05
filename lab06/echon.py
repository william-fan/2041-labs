#!/usr/bin/python
import sys

if (len(sys.argv) != 3 ):
	print "Usage: ./echon.py <number of lines> <string>"	#check if number of arguments equal to 3
	exit()
try:
	number = int(sys.argv[1])
except:
	print "./echon.py: argument 1 must be a non-negative integer"	#try changing first argument into int
	exit()
try:
	int(sys.argv[1]) < 0			#try checking if argument is less than zero
except:
	print "./echon.py: argument 1 must be a non-negative integer"
	exit()

number = int(sys.argv[1]);
string = str(sys.argv[2]);

while (number != 0):
	print string	#print while number is not zero
	number -= 1
