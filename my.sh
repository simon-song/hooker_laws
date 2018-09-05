
echo "copy file book5.tex ..."
cp backup/book5_orig.tex book5.tex

echo "Remove lines starting with BOOK V ..."
perl -p -e 's/^BOOK V.*\n//g; s/&/\\&/g;' book5.tex >a.tex  
mv a.tex book5.tex

echo "Remove line number such as [312] ..."
perl -p -e 's/\[[0-9]{3}\]//g; s/\[[2-9][0-9]\]//g; s/\[1[1-9]\]//g;' book5.tex >a.tex  
mv a.tex book5.tex

echo "Remove footnote numbers ..."
perl -p -e 's/([a-z])([0-9]{1,2})([,.:;? ])/\1\3/g;' book5.tex >a.tex  
mv a.tex book5.tex

echo "Find and add section title ..."
perl my.pl <book5.tex >a.tex  
mv a.tex book5.tex

