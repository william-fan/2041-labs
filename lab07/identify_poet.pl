#!/usr/bin/perl -w
$count = 0;
$word = 0;
@text = ();

foreach $file (glob "poems/*.txt") { 		#for each writer
	@text = 0;
	open(F,"<","$file") or die "$0: can't open $file: $!\n"; #open file
	$b = $file;
	$b =~ s/_/ /g;
	$b =~ s/(poems|.txt|\/)//g;	#remove needless characters
	$count{$b} = 0;
	while ($lines = <F>){
		#$lines = lc($lines);
		#chomp($lines);		
		@text = $lines =~ /([A-Za-z]+)/g; #split line on words
		foreach $arg (@text){
			$count{$b}++;
			$word{$b}{lc $arg}++;	#add for all words and specific word from the 10 files
		}
	}
}	
foreach $poem (@ARGV){
	%total = ();	#reset values
	%prob = ();
	open(F,"<","$poem") or die "$0: can't open $poem: $!\n"; #open file
	foreach $line (<F>){
		while ($line =~ /([A-Za-z]+)/g){	#match on words
			$total{lc $1} += 1;	#count word occurence
		}
	}
	foreach $b (keys %count){
		foreach $a (sort keys %total){	
			$word{$b}{$a} = 0 if !exists $word{$b}{$a};	#create new key if none found
			$prob{$b} += log(($word{$b}{$a}+1)/($count{$b})) * $total{$a};	#add log value, based on word occurence
		}
	}
	$log = $prob{$b};
	$poet = $b;
	foreach $file (keys %prob){	
		if ($prob{$file} > $log) {		#find highest log value and poet
			$log = $prob{$file};
			$poet = $file;
		}
	}
	printf("%s most resembles the work of %s (log-probability=%.1f)\n",$poem,$poet,$log);
}


