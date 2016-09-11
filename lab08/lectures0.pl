#!/usr/bin/perl -w
#@list = ();
foreach $arg (@ARGV){
	$url = "http://timetable.unsw.edu.au/current/$arg.html";
	open F, "wget -q -O- $url|" or die "can't open $url";
	while ($line = <F>){
		if ($line =~ /[A-Z][a-z][a-z] [0-9]/){
			$line =~ s/<\/td>//;
			$line =~ s/<.*>//;
			$line =~ s/\s+/ /g;
			$arg{}
			print "$line\n";
		}
	}
}