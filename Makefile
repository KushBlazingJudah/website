PREFIX ?= ./_out/

COPY = style.css key.asc favicon.ico media
FILES = software.md thoughts.md tunes.md index.md catalog.md
ARTICLES = $(shell find articles -type f -name "*.md")

all: $(PREFIX) $(PREFIX)articles

$(PREFIX): $(FILES:.md=.html) $(COPY) index.rss index.xml
	@if [ ! -e "$@" ]; then mkdir "$@"; fi
	@printf 'CP\t$@\n'
	@cp -r $^ $(PREFIX)

$(PREFIX)articles: $(ARTICLES:.md=.html)
	@if [ ! -e "$@" ]; then mkdir "$@"; fi
	@printf 'CP\t$@\n'
	@cp -r $^ $(PREFIX)/articles

index.rss: $(ARTICLES)
	@printf 'RSS\t%s\n' "$@"
	@./lib/rss.sh $^ > $@

index.xml: $(ARTICLES)
	@printf 'RSS\t%s\n' "$@"
	@./lib/rss.sh $^ > $@

catalog.md: $(ARTICLES)
	@./lib/catalog.sh $^ > $@

%.html: %.md
	@printf 'MD\t%s\n' "$<"
	@lowdown -Thtml "$<" | ./lib/process.sh $< > $@

clean:
	rm -rf $(PREFIX) $(FILES:.md=.html) $(ARTICLES:.md=.html) index.rss index.xml catalog.md
