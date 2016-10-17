SOURCEDIR = src
TEMPLATES = templates
BUILDDIR  = build

SOURCES=$(wildcard $(SOURCEDIR)/*.md)
SLIDES=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.html,$(SOURCES))
PDFS=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.pdf,$(SOURCES))

.PHONY: all
all: slides pdfs

.PHONY: slides
slides: $(SLIDES)

.PHONY: pdfs
pdfs: $(PDFS)

.PHONY: clean
clean:
	rm -f \
		$(foreach slide, $(SLIDES), "$(slide)") \
		$(foreach pdf, $(PDFS), "$(pdf)")
	rmdir --ignore-fail-on-non-empty $(BUILDDIR)

$(SLIDES): $(BUILDDIR)/%.html : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" | \
		pandoc -s \
			-f markdown \
			-t dzslides \
			--self-contained \
			-V title="" \
			-H $(TEMPLATES)/header.html \
			-o "$@"

$(PDFS): $(BUILDDIR)/%.pdf : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" | \
		pandoc -s \
			-f markdown \
			-t latex \
			--latex-engine=xelatex \
			-V papersize=a4 \
			-V fontsize=12pt \
			-o "$@"
