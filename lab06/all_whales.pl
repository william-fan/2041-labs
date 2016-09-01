#!/usr/bin/perl -w
@total = ();
@list = ();
$count = 0;
$pod = 0;
while ($line = <STDIN>){
	push @total, $line; #push input into array
}

foreach $arg(@total){
	chomp($arg);		
	($number, $animal) = split(" ", $arg, 2);  #split input into two
	push @list, $animal;	#add list to list of species
}
foreach $species(@list){
	foreach $arg(@total){
		chomp($arg);
		($number, $animal) = split(" ", $arg, 2);
		if (defined $animal && $ARGV[0] eq $animal){
			$count += $number;
			$pod++;
		}
	}
	print "$ARGV[0] observations: $pod pods, $count individuals\n";
}
