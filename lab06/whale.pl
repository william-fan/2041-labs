#!/usr/bin/perl -w

while ($line = <>){
	$number = ($line =~ /^[0-9]+/);
	print $number;
}