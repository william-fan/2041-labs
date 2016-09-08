#!/usr/bin/perl -w
@words = ();
$count = 0;
$word = 0;

foreach $file (glob "poems/*.txt") {
	$count = 0;
	$word = 0;
	@words = ();
	open(F,"<","$file") or die "$0: can't open $file: $!\n"; #open file
	while ($lines = <F>){
		$lines = lc($lines);
		chomp($lines);		
		push @words , split(/([^A-Za-z])/, $lines); #split line on non chars
	}
	foreach $arg (@words){	#counting all words
		chomp($arg);
		if ($arg =~ "[A-Za-z]+" && $arg ne "" && $arg ne "\n"){ #if not empty or newline
			$count++;		
		}
	}	
	foreach $arg (@words){	#counting specific word
		$input = lc($ARGV[0]);
		chomp($arg);
		if ($arg =~ m/(^$input$)/g && $arg ne "" && $arg ne "\n"){ #if not empty or newline
			$word++;	
		}
	}
	$table {"$file"}{"Count"} = $count;
	$table {"$file"}{"Word count"} = $word;
}

foreach $file (glob "poems/*.txt") {
	$a = $table{"$file"}{"Word count"};
	$b = $table{"$file"}{"Count"};
	$file =~ s/_/ /g;
	$file =~ s/(poems|.txt|\/)//g;
	printf ("log((%d+1)/%6d) = %8.4f %s\n", $a, $b, log((($a+1)/$b)), $file);	
}



