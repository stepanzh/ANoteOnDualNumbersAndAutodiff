main.pdf: main.tex
	mkdir -p Aux
	latexmk -xelatex -aux-directory=Aux main.tex

clear:
	rm -rf Aux
	rm -f *.aux
	rm -f *.bbl *.bcf *.blg
	rm -f *.fls *.log *.out *.run.xml
	rm -f *.xdv
	rm -f *.fdb_latexmk
	rm -f *synctex.gz
