#!/usr/bin/perl -w
@list = ();

$url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$ARGV[0].html";
open F, "wget -q -O- $url|" or die "can't open $url";

while ($line = <F>) {
	if ($line =~ "Prerequisite: .*<" || $line =~ "Prerequisites: .*<"){
		$temp = $line;
		$temp =~ s/<\/p>.*//;
		chomp($temp);
		push @list,($temp =~ m/[A-Z]{4}[0-9]{4}/g);

	}
}

$url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$ARGV[0].html";
open F, "wget -q -O- $url|" or die "can't open $url";

while ($line = <F>) {
	if ($line =~ "Prerequisite: .*<" || $line =~ "Prerequisites: .*<"){
		$temp = $line;
		$temp =~ s/<\/p>.*//;
		chomp($temp);
		push @list,($temp =~ m/[A-Z]{4}[0-9]{4}/g);
	}
}

@list = sort @list;

foreach $arg (@list){
	print "$arg\n";
}
	