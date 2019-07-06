all: install build

build: doc.tex
	latexmk -f -pdf doc.tex

install: pkgs.txt
	tlinstall pkgs.txt

clean: 
	latexmk -c
