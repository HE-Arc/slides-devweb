SOURCEDIR = src
BUILDDIR = build
TEMPLATES = templates

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
	rm -rf $(BUILDDIR)

$(SLIDES): $(BUILDDIR)/%.html : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	pandoc -s -i \
		-f markdown \
		-t dzslides \
		--self-contained \
		-H $(TEMPLATES)/header.html \
		-o $@ \
		$^

$(PDFS): $(BUILDDIR)/%.pdf : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	pandoc -s -i \
		-f markdown \
		-t latex \
		-o $@ \
		$^
