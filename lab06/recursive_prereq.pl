#!/usr/bin/perl -w
@list = ();
@sort = ();
@print = ();
$count = 0;
$a = 0;
if ($ARGV[0] eq "-r") {	
	$url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$ARGV[1].html";
	open F, "wget -q -O- $url|" or die "can't open $url";
	while ($count != 2){
		while ($line = <F>) {
			if ($line =~ "Prerequisite: .*<" || $line =~ "Prerequisites: .*<" || $line =~ "Pre-Requisite"){
				$temp = $line;
				$temp =~ s/<\/p>.*//;
				chomp($temp);
				$temp = uc($temp);
				push @list,($temp =~ m/[A-Za-z]{4}[0-9]{4}/g);
			}
		}
		$url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$ARGV[1].html";
		open F, "wget -q -O- $url|" or die "can't open $url";
		$count++;
	}

	foreach $arg (@list){
		push @sort, $arg;
		#shift @list;
		$url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$arg.html";
		open F, "wget -q -O- $url|" or die "can't open $url";
		$count = 0;
		$a = 0;
		while ($count != 2){
			while ($line = <F>) {
				if ($line =~ "Prerequisite: .*<" || $line =~ "Prerequisites: .*<" || $line =~ "Pre" || $line =~ "Pre-Requisite" ){
					$temp = $line;
					$temp =~ s/<\/p>.*//;
					chomp($temp);
					$temp = uc($temp);
					foreach $type(@list){
						if ($type eq $temp){
							$a = 1;
						}
					}
					if ($a == 0) { push @list,($temp =~ m/[A-Za-z]{4}[0-9]{4}/g)}; 

				}
			}
			$url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$arg.html";
			open F, "wget -q -O- $url|" or die "can't open $url";
			$count++;
		}	

	}

	foreach $arg (@sort){
		$bool = 0;
		foreach $val (@print){
			if ($arg eq $val){	
				$bool = 1;
			}
	
		}
		if ($bool == 0){ push @print, $arg };
	}

	@print = sort @print;

	foreach $arg (@print){
		print "$arg\n";
	}
} else {
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
}

