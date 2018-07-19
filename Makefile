SHELL=C:/Windows/System32/cmd.exe
#LATEX = pdflatex
LATEX = xelatex
SOURCES = *.tex

all: hooker_laws.pdf

hooker_laws.pdf: $(SOURCES)
	$(LATEX) hooker_laws.tex
#	makeindex hooker_laws.idx
	$(LATEX) hooker_laws.tex

clean:
	rm -f *~ *.aux *.idx *.ilg *.ind *.log *.out *.toc hooker_laws.pdf .pdf
