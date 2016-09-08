#!/usr/bin/perl -w
@words = ();
@list = ();
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
		push @list, $arg;	
		#print "$arg|";
	}
}

foreach $arg (@list){
	$count++;
}
print "$input occurred $count times\n";