#####################################################################
##         convert .tex file into plain html
##
## to delete all lines in .html file with <h2 ... /h2>, in vim do 
##    :g/<h2/d
#####################################################################

$ pandoc preface.tex -o p.html -t html5

