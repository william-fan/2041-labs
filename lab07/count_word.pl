#!/usr/bin/perl -w
@words = ();
$count = 0;

while ($lines = <STDIN>){
	$lines = lc($lines);	
	chomp($lines);		
	push @words , split(/([^A-Za-z])/, $lines); #split line on non chars
}

foreach $arg (@words){
	$input = lc($ARGV[0]);
	chomp($arg);
	if ($arg =~ m/(^$input$)/g && $arg ne "" && $arg ne "\n"){ #if not empty or newline
		$count ++;
		#print "$arg|";
	}
}

print "$input occurred $count times\n";