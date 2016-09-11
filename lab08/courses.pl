#!/usr/bin/perl -w
@list = ();
$url = "http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html"; 	#open url
open F, "wget -q -O- $url|" or die "can't open $url";
while ($line = <F>){
	if ($line =~ /[A-Z]{4}[0-9]{4}/){
		$course = $line;
		$course =~ m/[A-Z]{4}[0-9]{4}/g;
		push @list,($course =~ m/[A-Z]{4}[0-9]{4}/g);
	}
}

foreach $arg (@list){
	print "$arg\n";
}