src=$(wildcard *.md)
dst=$(src:.md=.html)

build: $(dst)

push:
	neocities push -e Makefile -e make.sh -e _header.html -e _footer.html .

%.html: %.md
	./make.sh $^ > $@

clean:
	rm $(dst)

.PHONY: clean build
