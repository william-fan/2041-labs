#!/usr/bin/perl -w
@files = ();
$number = 10;
foreach $arg (@ARGV) {
    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit(0);
    }
    elsif ($arg =~ "-[0-9]") {
		$number = $arg;
		$number =~ s/-//;
	}
    else {
        push @files, $arg;
    }
}
foreach $f (@files) {
    open(F,"<$f") or die "$0: can't open $f: $!\n";
	while (<>){
		while ($number != 0){
			
		}
		print;
	}
	print "\n";
    close(F);
}

