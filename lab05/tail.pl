#!/usr/bin/perl -w
@files = ();
$number = 10; #default number of lines shown
$temp = 10; #stores number
foreach $arg (@ARGV) {
    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit(0);
    }
    elsif ($arg =~ "-[0-9]+") { #matches number of lines argument
		$number = $arg;
		$number =~ s/-//; #remove -
		$temp = $number;
	}
    else {
        push @files, $arg;
    }
}
if (scalar @files == 0){	#if no input files read from stdio
	$number = $temp;	#reset numbers
	$lines = 0;	
	open(F,"-");	#open stdio
	while (<F>){	
		$lines++;	#count no of lines
	}
	if ($lines - $number < 0){	
		$number = 0;
	}
	else {
		$number = $lines - $number;	
	}
	seek F,0,0; #go to the beginning of the file
	while (<F>){
		if ($number <= 0){	#print only past certain number of lines
			print;			
		}
		$number--;
	}
	close(F);
}
foreach $f (@files) {
	$number = $temp;
	$lines = 0;
	if (scalar @files > 1){	#if more than one file print title
		print "==> $f <==\n"
	}
	open(F,"<","$f") or die "$0: can't open $f: $!\n";
	while (<F>){
		$lines++;
	}
	if ($lines - $number < 0){
		$number = 0;
	}
	else {
		$number = $lines - $number;
	}
	seek F,0,0; #go to the beginning of the file
	while (<F>){
		if ($number <= 0){
			print;
		}
		$number--;
	}
    close(F);
}

