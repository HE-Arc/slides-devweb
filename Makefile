pages=00-presentation.html

all: $(pages)

%.html: %.md
	pandoc -s -i \
		-f markdown \
		-t dzslides \
		--self-contained \
		-H header.html \
		-o $@ \
		$^
