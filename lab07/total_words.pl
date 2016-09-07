#!/usr/bin/perl -w
@words = ();
$count = 0;

while ($lines = <STDIN>){	
	chomp($lines);		
	push @words , split(/([^A-Za-z])/, $lines); #split line on non chars
}

foreach $arg (@words){
	chomp($arg);
	if ($arg =~ "[A-Za-z]+" && $arg ne "" && $arg ne "\n"){ #if not empty or newline
		$count++;		
	}
}
print "$count words\n";	