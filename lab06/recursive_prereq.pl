#!/usr/bin/perl -w
@list = ();
$count = 0;
$a = 0;
$url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$ARGV[0].html";
open F, "wget -q -O- $url|" or die "can't open $url";
while ($count != 2){
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
	$count++;
}

foreach $arg (@list){
	print "$arg\n";
	#shift @list;
	$url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$arg.html";
	open F, "wget -q -O- $url|" or die "can't open $url";
	$count = 0;
	while ($count != 2){
		while ($line = <F>) {
			if ($line =~ "Prerequisite: .*<" || $line =~ "Prerequisites: .*<"){
				$temp = $line;
				$temp =~ s/<\/p>.*//;
				chomp($temp);
				foreach $type(@list){
					if ($type eq $temp){
						$a = 1;
					}
				}
				if ($a == 0) { push @list,($a =~ m/[A-Z]{4}[0-9]{4}/g)}; 

			}
		}
	$url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$ARGV[0].html";
	open F, "wget -q -O- $url|" or die "can't open $url";
	$count++;
	}	

}
	