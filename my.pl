#########################################################
##   usage: $ perl my.pl <infile.txt >outfile.txt
#########################################################
#!/usr/bin/perl

use strict;
use warnings;

use constant false => 0;
use constant true => 1;

my @names = ("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", 
"X", "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", 
"XX", "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", 
"XXX", "XXXI", "XXXII", "XXXIII", "XXXIV", "XXXV", "XXXVI", "XXXVII", "XXXVIII", "XXXIX", 
"XL", "XLI", "XLII", "XLIII", "XLIV", "XLV", "XLVI", "XLVII", "XLVIII", "XLIX", 
"L", "LI", "LII", "LIII", "LIV", "LV", "LVI", "LVII", "LVIII", "LIX", 
"LX", "LXI", "LXII", "LXIII", "LXIV", "LXV", "LXVI", "LXVII", "LXVIII", "LXIX", 
"LXX", "LXXI", "LXXII", "LXXIII", "LXXIV", "LXXV", "LXXVI", "LXXVII", "LXXVIII", "LXXIX", 
"LXXX", "LXXXI");

my @count;
my @newpat; 

for my $i (0 .. $#names) {
  push @count, 0;
  push @newpat, "sssssssssssssss";
}

#my @linesall = <STDIN>;  # read all lines
#print @linesall;

while (my $line = <STDIN>) {
  my $cleanline = true;

  for my $i (0 .. $#names) {
    my $pattern ="^$names[$i]\. ";
    if ($line =~ $pattern) {
      ++$count[$i];
      $cleanline = false;
      if ($count[$i] == 1) { # first match
        $newpat[$i] = $line;
        $newpat[$i] =~ s/$pattern//;  # remove any match of $pattern
        $newpat[$i] =~ s/\s+$//;  # remove trailing whitespaces
      } 
      if ($count[$i] == 2) { # second match
        my $newstr = "\\section*{$newpat[$i]}\n";
        print $newstr
      }
      print $line
    }
    elsif ($line =~ $newpat[$i]) {
      $cleanline = false;
      # do nothing if matching $newpat
    }
  }

  if ($cleanline) {
    print $line;
  }
}







#my $count = 0;
#my $pattern = "^I\. ";  # i.e. "I. "
##my $pattern = "^II\.";
#my $newpat = "sssssssssssssss";

#my @linesall = <STDIN>;  # read all lines
#print @linesall;

#while (my $line = <STDIN>) {
#  if ($line =~ $pattern) {
#  #if ($line =~ "^I\. ") {
#    ++$count;
#    if ($count == 1) {
#      #print "first match\n";
#      $newpat = $line;
#      $newpat =~ s/$pattern//;  # remove any match of $pattern
#      $newpat =~ s/\s+$//;  # remove trailing whitespaces
#    } 
#    if ($count == 2) {
#      my $newstr = "\\section*{$newpat}\n";
#      #print "second match\n";
#      print $newstr
#    }
#    #print "Found pattern.\n";
#    print $line
#  }
#  elsif ($line =~ $newpat) {
#    # do nothing if matching $newpat
#  }
#  else {
#    print $line;
#  }
#}

#print "count=$count\n";



