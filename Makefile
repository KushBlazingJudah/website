htmldest ?= ./_html/
gmidest ?= ./_gmi/

COPY = key.asc media
FILES = software.md thoughts.md tunes.md index.md catalog.md discord.md
ARTICLES = $(shell find articles -type f -name "*.md")

all: html

html: $(htmldest) $(htmldest)articles

gmi: $(gmidest) $(gmidest)articles

$(htmldest): $(FILES:.md=.html) $(COPY) index.xml style.css favicon.ico
	@if [ ! -e "$@" ]; then mkdir "$@"; fi
	@printf 'CP\t$@\n'
	@cp -r $^ $(htmldest)

$(htmldest)articles: $(ARTICLES:.md=.html)
	@if [ ! -e "$@" ]; then mkdir -p "$@"; fi
	@printf 'CP\t$@\n'
	@cp -r $^ $(htmldest)/articles

$(gmidest): $(FILES:.md=.gmi) $(COPY) index.xml
	@if [ ! -e "$@" ]; then mkdir "$@"; fi
	@printf 'CP\t$@\n'
	@cp -r $^ $(gmidest)

$(gmidest)articles: $(ARTICLES:.md=.gmi)
	@if [ ! -e "$@" ]; then mkdir -p "$@"; fi
	@printf 'CP\t$@\n'
	@cp -r $^ $(gmidest)/articles

index.xml: $(ARTICLES)
	@printf 'RSS\t%s\n' "$@"
	@./lib/rss.sh $^ > $@

catalog.md: $(ARTICLES)
	@printf 'CATALOG\t$@\n'
	@./lib/catalog.sh $^ > $@

%.html: %.md
	@printf 'HTML\t%s\n' "$<"
	@lowdown -Thtml "$<" | ./lib/process.sh $< > $@


# This sucks but I liked having it.
index.html: index.md
	@printf 'INDEX\t%s\n' "$<"
	@while IFS= read -r line; do \
		case "$$line" in \
			\[\[COWSAY\]\]) fortune -s | cowsay ;; \
			*) printf '%s\n' "$$line" ;; \
		esac \
	done < "$<" | lowdown -Thtml | ./lib/process.sh $< > $@

%.gmi: %.md
	@printf 'GMI\t%s\n' "$<"
	@lowdown -tgemini -s "$<" | ./lib/process-gmi.sh $< > $@

push: html
	./lib/neodiff.sh $(htmldest) | ./lib/neopush.sh $(htmldest)

clean:
	rm -rf $(htmldest) $(gmidest) $(FILES:.md=.html) $(ARTICLES:.md=.html) $(FILES:.md=.gmi) $(ARTICLES:.md=.gmi) index.xml catalog.md

.PHONY: clean push
