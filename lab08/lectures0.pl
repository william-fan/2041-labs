#!/usr/bin/perl -w

foreach $arg (@ARGV){
	%arg = ();
	$url = "http://timetable.unsw.edu.au/current/$arg.html";
	open F, "wget -q -O- $url|" or die "can't open $url";
	while ($line = <F>){
		if ($line =~ m/Lecture/){
			for ($count = 0; $count!=6; $count++){
				next;
			}
			$line =~ s/<\/td>//;
			$line =~ s/<.*>//;
			$line =~ s/\s+/ /g;
			$arg{$line}="$line";

			#print "$line\n";
		
		}
	}
	foreach $b (keys %arg){
		print "$arg: $arg{$b}\n";
	}
}
