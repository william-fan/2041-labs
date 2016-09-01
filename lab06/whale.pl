#!/usr/bin/perl -w
@total = ();
$count = 0;
$pod = 0;
while ($line = <STDIN>){
	push @total, $line; #push input into array
}
foreach $arg(@total){ 
	chomp($arg);	
	($number, $animal) = split(" ", $arg, 2); #split input into two
	if (defined $animal && $ARGV[0] eq $animal){
		$count += $number; 	#add to count of individuals
		$pod++;				#add to count of pod
	}
}
print "$ARGV[0] observations: $pod pods, $count individuals\n";