#!/bin/bash

for image in "$@"
do 
	display "$image" 
	echo -n "Address to e-mail this image to? "
	read email
	echo -n "Message to accompany image? "
	read message
	`echo "$message"|mutt -s "$image" -a "$image" -- $email`
	echo "$image" sent to $email
done

