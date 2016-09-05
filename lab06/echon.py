#!/usr/bin/python
import sys

if (len(sys.argv) != 3 ):
	print "Usage: ./echon.py <number of lines> <string>"
	exit()
try:
	number = int(sys.argv[1])
except:
	print "./echon.py: argument 1 must be a non-negative integer"
	exit()
try:
	int(sys.argv[1]) < 0
except:
	print "./echon.py: argument 1 must be a non-negative integer"
	exit()

number = int(sys.argv[1]);
string = str(sys.argv[2]);

while (number != 0):
	print string
	number -= 1
