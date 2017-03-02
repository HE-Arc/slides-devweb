SOURCEDIR = src
TEMPLATES = templates
BUILDDIR  = build

SOURCES=$(wildcard $(SOURCEDIR)/*.md)
SLIDES=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.html,$(SOURCES))
PDFS=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.pdf,$(SOURCES))
BOOKS=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.tmp,$(SOURCES))

LANGUAGE ?= fr

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
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" | \
		pandoc -s \
			-f markdown \
			-t dzslides \
			--self-contained \
			-V title="" \
			-V title-prefix="HE-Arc" \
			-H $(TEMPLATES)/header.html \
			-o "$@"

$(PDFS): $(BUILDDIR)/%.pdf : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" \
		| pandoc -s \
			-f markdown \
			-t latex \
			--latex-engine=xelatex \
			-V lang=$(LANGUAGE) \
			-V documentclass="scrartcl" \
			-V papersize=a4 \
			-V fontsize=12pt \
			-o "$@"

$(BOOKS): $(BUILDDIR)/%.tmp: $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	$(eval ref := $(shell echo $< | sed -e 's~[\/\-\.]~~g'))
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" \
		| sed -e "s~\[\([a-zA-Z0-f_\-\.]*\)\]\([^\[(]\)~[$(ref)-\1]\2~g" \
		| sed -e 's/^----*//g' \
		| sed -e '0,/<footer>/ s/^#.*$$//g' \
		| sed -e 's/<footer>.*<\/footer>//g' \
		| sed -e 's/^#/##/g' \
		| sed -e 's/^% [0-9]* *\.\(.*\)$$/\n\n# \1/g' \
		> $@

build/book.md: $(BOOKS)
	cat $(foreach source, $(sort $(BOOKS)), "$(source)") \
		> $@

build/book.pdf: build/book.md
	pandoc -s \
		-f markdown \
		-t latex \
		--latex-engine=xelatex \
		--toc \
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
