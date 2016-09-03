#!/usr/bin/perl -w

@total = ();
@edit = ();
@list = ();
@sort = ();
$count = 0;
$pod = 0;
$temp = 0;

while ($line = <STDIN>){
	push @total, $line; #push input into array
}

foreach $arg(@total){
	$a = lc($arg);	
	$temp = 0;	#flag if animal already exists
	chomp($a);		
	$a =~ s/\s+$//;
	$a =~ s/\s+/ /g;		#remove whitespace and trailing s
	$a =~ s/s$//g;
	push @edit, $a;
	#print lc($arg);
	($number, $animal) = split(" ", $a, 2);  #split input into two
	#print "$animal|";
	foreach $type(@list){
		if ($type eq $animal){	#check if animal exists in list
			$temp = 1;
		}
	}
	if ($temp == 0) { push @list, $animal }; #add list to list of species
	
}

foreach $species(@list){	#loop through species
	$count = 0;
	$pod = 0;
	foreach $arg(@edit){	#loop through edited stdin
		chomp($arg);
		($number, $animal) = split(" ", lc($arg), 2);		
		if (defined $animal && $species eq $animal){
			$count += $number;		#add to final count
			$pod++;
		}
		#print "$arg|";
	}
	push @sort, "$species observations: $pod pods, $count individuals\n";	
}

@sort = sort @sort;	#sort output
foreach $arg(@sort){
	print $arg;
}
