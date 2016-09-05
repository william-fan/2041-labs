#!/usr/bin/python
import string
import sys

for line in sys.stdin:
	print line.translate(string.maketrans("012346789", "<<<<<>>>>")),
