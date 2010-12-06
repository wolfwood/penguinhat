#!/usr/bin/perl -w

use strict;
my($o, $mod, $prefix);


foreach $mod (@ARGV) {
		$o = $mod;
		$o =~ s/ko$/o/;
		$prefix = $mod;
		$prefix =~ s/.ko//;
		
		system("objcopy --redefine-sym init_module=init_$prefix\_module --redefine-sym cleanup_module=cleanup_$prefix\_module $mod $o");
}
