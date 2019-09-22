all: install build

build: doc.tex
	latexmk
	latexmk -c

watch: doc.tex
	latexmk -pvc

install:
	tlmgr install fontawesome

clean: 
	latexmk -C
