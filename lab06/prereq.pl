#!/usr/bin/perl -w
@list = ();
$url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$ARGV[0].html";
open F, "wget -q -O- $url|" or die "can't open $url";

while ($line = <F>) {
	if ($line =~ "Prerequisite: .*<"){
		$temp = $line;
		#$temp =~ s/^(Prerequisite)//;
		push @list, $temp;
	}
    #print $line;
}
foreach $arg (@list){
	print $arg;
}
	