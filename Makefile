SOURCEDIR = src
TEMPLATES = templates
BUILDDIR  = build

SOURCES=$(wildcard $(SOURCEDIR)/*.md)
SLIDES=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.html,$(SOURCES))
PDFS=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.pdf,$(SOURCES))
BOOKS=$(patsubst $(SOURCEDIR)/%.md,$(BUILDDIR)/%.tex,$(SOURCES))

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
	latexmk -C $(TEMPLATES)/book.tex
	rm -f \
		$(foreach slide, $(SLIDES), "$(slide)") \
		$(foreach pdf, $(PDFS), "$(pdf)") \
		$(foreach book, $(BOOKS), "$(book)") \
		build/book.*
	rmdir --ignore-fail-on-non-empty $(BUILDDIR)

$(SLIDES): $(BUILDDIR)/%.html : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" \
		| sed -e "\$$a# Sources" \
		| pandoc -s \
		        -f markdown \
			-t dzslides \
			--embed-resources \
			--sstandalone \
			--lua-filter=meta.lua \
			--citeproc \
			-V show-notes=true \
			-V title="" \
			-V title-prefix="HE-Arc" \
			-H $(TEMPLATES)/header.html \
			-o "$@"

$(PDFS): $(BUILDDIR)/%.pdf : $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" \
		| sed -e "\$$a# Sources" \
		| pandoc -s \
			-f markdown \
			-t latex \
			--pdf-engine=xelatex \
			--lua-filter=meta.lua \
			--lua-filter=english.lua \
			--filter=pandoc-citeproc \
			-H $(TEMPLATES)/header.tex \
			-V documentclass="scrartcl" \
			-V links-as-notes=true \
			-o "$@"

$(BOOKS): $(BUILDDIR)/%.tex: $(SOURCEDIR)/%.md
	mkdir -p $(BUILDDIR)
	sed -e 's/(\(img\/\)/($(SOURCEDIR)\/\1/g' "$^" \
		| sed -e '0,/<footer>/ s/^#.*$$//g' \
		| sed -e 's/<footer>.*<\/footer>//g' \
		| sed -e 's/^----*//g' \
		| sed -e "\$$a# Sources" \
		| pandoc -f markdown \
			-t latex \
			--lua-filter=meta.lua \
			--lua-filter=english.lua \
			--filter=pandoc-citeproc \
		> $@

$(BUILDDIR)/book.pdf: $(TEMPLATES)/book.tex $(BOOKS)
	latexmk -pdf $<
	latexmk -c $<
	mv book.pdf build/

$(BUILDDIR)/index.html: $(SLIDES)
	cat $(TEMPLATES)/indexTop.html > $@
	$(foreach source,$(sort $^),echo "<div class="chapter"><a href='$(source)' class='left'>" | sed -e "s/$(BUILDDIR)\///g" >> $@; \
		echo $(basename $(source)) | sed -e "s/$(BUILDDIR)\///g" \
			-e "s/[[:digit:]]\+-//g" \
			-e "s/-/ /g" \
			-e "s/\b\(.\)/\u\1/g" >> $@; \
		echo "</a><a href='$(patsubst %.html,%.pdf,$(source))' class='right'>PDF</a></div>" | sed -e "s/$(BUILDDIR)\///g" >> $@;)
	echo "<a href='book.pdf' class='book'>Livre complet</a>" >> $@
	cat $(TEMPLATES)/indexBottom.html >> $@
	cat $(SOURCEDIR)/css/normalize.css > $(BUILDDIR)/style.css
	cat $(SOURCEDIR)/css/component.css >> $(BUILDDIR)/style.css
	cat $(SOURCEDIR)/css/demo.css >> $(BUILDDIR)/style.css
