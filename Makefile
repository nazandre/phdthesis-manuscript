.PHONY: clean reallyclean

FILENAME=andre-naz-phdthesis
FILENAMECMP=$(FILENAME)-cmp
BIBFILE = thesis.bib
EXTRA_FILES=$(wildcard src/*.tex)

VERBOSE=1
#VERBOSE=0

SCRIPTDIR=scripts

all: ${FILENAMECMP}.pdf

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

#%.pdf: %.tex *.bib
#	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

${FILENAME}.pdf: ${FILENAME}.tex $(EXTRA_FILES) $(BIBFILE)
	${SCRIPTDIR}/compile.sh ${FILENAME} ${VERBOSE}

${FILENAMECMP}.pdf: ${FILENAME}.pdf
	${SCRIPTDIR}/compress.sh ${FILENAME}.pdf ${FILENAMECMP}.pdf ${VERBOSE}

clean:
	rm -f *.aux *.log *.fls *.bbl *.blg *.synctex.gz *.fdb_latexmk *~ ,\
	*.ist *.acr *.alg *.acn *.lot *.toc *.lof *.glo *.glg *.gls *.out ,\
	*.xdy *.mtc* *.ist *.loe *.idx *.maf *.xdy 

reallyclean: clean
	rm -f ${FILENAME}.pdf ${FILENAMECMP}.pdf
