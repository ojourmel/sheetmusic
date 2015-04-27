# Oliver Jourmel
#
# Lilypond build system
FILE=`basename \`ls *.tex | head\` .tex`


run: compile
	true

compile:
	lilypond-book --output=out --pdf $(FILE).tex
	cd out; \
	pdflatex $(FILE); \
	mv $(FILE).pdf ../$(FILE).pdf; \
	cd ../; \
	rm -rf out; \
	true;

cleanCompile:
	rm -f *-blx.bib *.run.xml *.bbl *.blg *.ps *.dvi *.aux *.log *.toc *.out *~ 2> /dev/null

cleanAll: cleanCompile
	rm -f *.pdf 2> /dev/null

clean: cleanAll
