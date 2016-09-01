#!/usr/bin/perl -w
@total = ();
$count = 0;
$pod = 0;
while ($line = <STDIN>){
	push @total, $line;
}
foreach $arg(@total){
	chomp($arg);
	($number, $animal) = split(" ", $arg, 2);
	if (defined $animal && $ARGV[0] eq $animal){
		$count += $number;
		$pod++;
	}
}
print "$ARGV[0] observations: $pod pods, $count individuals\n";