#!/usr/bin/perl -w

open(OUT, "| sort | uniq");

while(<>){
		if(m/undefined reference to `([^']*)/){
				print OUT "$1\n";
		}
}

close OUT;
