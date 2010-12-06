#!/usr/bin/perl -w

open(OUT, ">dummy.d");

print OUT "module dummy;\n";
print OUT "import tango.io.Stdout;\n";
print OUT "extern(C):\n";

while(<>){
		chomp;
		print OUT "int $_(){Stdout(\"$_\").newline;return -1;}\n"
}

close OUT;
