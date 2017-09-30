SOURCEDIR = src
TEMPLATES = templates
BUILDDIR  = build

SOURCES=$(wildcard $(SOURCEDIR)/*.md)
SLIDES=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.html,$(SOURCES))
PDFS=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.pdf,$(SOURCES))
BOOKS=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.tmp,$(SOURCES))

LANGUAGE ?= fr
BIB = $(SOURCEDIR)/bibliographie.yaml
CSL = ens-de-lyon-centre-d-ingenierie-documentaire.csl

.PHONY: all
all: slides pdfs book

.PHONY: slides
slides: $(SLIDES)

.PHONY: pdfs
pdfs: $(PDFS)

.PHONY: book
book: build/book.pdf

.PHONY: clean
clean:
	rm -f \
		$(foreach slide, $(SLIDES), "$(slide)") \
		$(foreach pdf, $(PDFS), "$(pdf)") \
		$(foreach book, $(BOOKS), "$(book)") \
		build/book.*
	rmdir --ignore-fail-on-non-empty $(BUILDDIR)

$(SLIDES): $(BUILDDIR)/%.html : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" \
		| sed -e "\$$a# Bibliographie" \
		| pandoc -s \
			-f markdown \
			-t dzslides \
			--self-contained \
			--filter=pandoc-citeproc \
			--biblio=$(BIB) \
			--csl=$(CSL) \
			-V show-notes=true \
			-V title="" \
			-V title-prefix="HE-Arc" \
			-H $(TEMPLATES)/header.html \
			-o "$@"

$(PDFS): $(BUILDDIR)/%.pdf : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" \
		| sed -e "\$$a# Bibliographie" \
		| pandoc -s \
			-f markdown \
			-t latex \
			--filter=pandoc-citeproc \
			--biblio=$(BIB) \
			--csl=$(CSL) \
			--latex-engine=xelatex \
			-H $(TEMPLATES)/header.tex \
			-V lang=$(LANGUAGE) \
			-V documentclass="scrartcl" \
			-V papersize=a4 \
			-V mainfont="Linux Libertine O" \
			-V sansfont="Linux Biolinum O" \
			-V monofontoptions=="Scale=0.9" \
			-V linkcolor="blue" \
			-V urlcolor="blue" \
			-o "$@"

$(BOOKS): $(BUILDDIR)/%.tmp: $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	$(eval ref := $(shell echo $< | sed -e 's~[\/\-\.]~~g'))
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" \
		| sed -e "s~\[\([a-zA-Z0-f_\-\.]*\)\]\([^\[(]\)~[$(ref)-\1]\2~g" \
		| sed -e '0,/<footer>/ s/^#.*$$//g' \
		| sed -e 's/<footer>.*<\/footer>//g' \
		| sed -e 's/^#/##/g' \
		| sed -e 's/^% [0-9]* *\.\(.*\)$$/\n\n# \1/g' \
		> $@

build/book.md: $(BOOKS)
	cat $(foreach source, $(sort $(BOOKS)), "$(source)") \
		> $@
	echo "# Bibliographie" >> $@

build/book.pdf: build/book.md
	pandoc -s \
		-f markdown \
		-t latex \
		--latex-engine=xelatex \
		--filter=pandoc-citeproc \
		--biblio=$(BIB) \
		--csl=$(CSL) \
		--toc \
		-H $(TEMPLATES)/header.tex \
		-V lang=$(LANGUAGE) \
		-V title="Application Web II" \
		-V subtitle="HE-Arc Ingénierie" \
		-V date="$(shell date +"%d %B %Y")" \
		-V papersize=a4 \
		-V documentclass="scrreprt" \
		-V mainfont="Linux Libertine O" \
		-V sansfont="Linux Biolinum O" \
		-V monofontoptions=="Scale=0.9" \
		-V linkcolor="blue" \
		-V urlcolor="blue" \
		-o $@ \
		$^

$(BUILDDIR)/index.html: $(SLIDES)
	echo "<!DOCTYPE html><meta charset=utf-8><title>Slides</title>" > $@
	echo "<h1>Slides</h1><ul>" >> $@
	echo $(foreach source, $(sort $^), "<li><a href='$(source)'>$(source)</a>") \
		| sed -e "s/$(BUILDDIR)\///g" \
		>> $@
	echo "</ul>" >> $@
