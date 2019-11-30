BIBTEX   = biber
PDFTEX = pdflatex -interaction=nonstopmode -halt-on-error -shell-escape

.PHONY: all

TEX := $(wildcard dguest-*.tex)
ALLSRC := $(TEX)
all: $(ALLSRC:.tex=.pdf)

IGNORE_WARNINGS := 'Marginpar on page|float specifier changed'
COLOR_WARNINGS := '^LaTeX Warning:|Fatal error'
FILTER_WARN := egrep -v $(IGNORE_WARNINGS) | egrep --color $(COLOR_WARNINGS)
%.pdf: %.tex
	$(PDFTEX) $<
