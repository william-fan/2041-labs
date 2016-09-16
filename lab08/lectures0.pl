#!/usr/bin/perl -w
@list = ();
foreach $arg (@ARGV){
	@list = ();
	%arg = ();
	$url = "http://timetable.unsw.edu.au/current/$arg.html";
	open F, "wget -q -O- $url|" or die "can't open $url";
	while ($line = <F>){
		push @list, $line;
	}
	for ($count = 0; $count!=scalar @list; $count++){
		if ($list[$count] =~ m/Lecture<\/a>/){
			#print $list[$count];
			$temp = $list[$count+6];
			$sem = $list[$count+1];
			chomp($temp);
			chomp($sem);
			$temp =~ s/<\/td>//;
			$temp =~ s/<.*>//;
			$temp =~ s/\s+/ /g;
			$sem =~ s/<\/td>//;
			$sem =~ s/<\/a>//;
			$sem =~ s/<.*>//;
			$sem =~ s/\s+/ /g;
			$sem =~ tr/T/S/;
			$sem =~ tr/U/X/;
			#print $sem;
			$bool = 0;
			foreach $a (keys %arg){
				if ($temp eq $arg{$a}){
					$bool = 1;
				}
			}
			if ($temp =~ /[A-Z]/ && $bool == 0){
				$arg{$count}="$temp";
				$arg{$count}{sem}="$sem";
				#print "$temp\n";
			}

		}
	}
	foreach $b (sort keys %arg){
		print "$arg:$arg{$b}{sem}$arg{$b}\n";
	}
}
