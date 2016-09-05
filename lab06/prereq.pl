#!/usr/bin/perl -w
@list = ();
$count = 0;
$url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$ARGV[0].html"; 	#open undergraduate
open F, "wget -q -O- $url|" or die "can't open $url";


while ($count != 2){ 	#loop twice
	while ($line = <F>) {	
		if ($line =~ "Prerequisite: .*<" || $line =~ "Prerequisites: .*<"){ #check for lines
			$temp = $line;
			$temp =~ s/<\/p>.*//;	#remove past </p> tag
			chomp($temp);	
			push @list,($temp =~ m/[A-Z]{4}[0-9]{4}/g);	#store matching pattern
		}
	}
	$url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$ARGV[0].html"; #open postgraduate
	open F, "wget -q -O- $url|" or die "can't open $url";
	$count++;
}

@list = sort @list; #sort list

foreach $arg (@list){
	print "$arg\n";	
}
	