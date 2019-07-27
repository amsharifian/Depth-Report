PAPER = main
TEX = $(wildcard *.tex)
#TEX = $(shell find . -name '*.tex' )
BIB = references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) 
	echo $(FIGS)
	pdflatex --synctex=1 -shell-escape $(PAPER) 
	bibtex $(PAPER)
	pdflatex -shell-escape $(PAPER) 
	pdflatex -synctex=1 -shell-escape $(PAPER) 

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf

