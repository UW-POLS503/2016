RMD_FILES = $(wildcard *.Rmd)
HTML_FILES = $(RMD_FILES:%.Rmd=%.html)
HTML_FILES_DEPENDS = $(wildcard include/*) _navbar.html _output.yaml .Rprofile

all: html

html: $(HTML_FILES)

%.html: %.Rmd $(HTML_FILES_DEPENDS)
	R --slave -e "rmarkdown::render('$<')"

watch:
	watchman watch "$(shell pwd)"
	watchman -- trigger "$(shell pwd)" remake '*.Rmd' $(HTML_FILES_DEPENDS) -- make html

unwatch:
	watchman watch-del "$(shell pwd)"

.PHONY: clean
clean:
	-rm -rf *_cache *_files

.PHONY: clean-all
clean-all: clean
	-rm -rf $(HTML_FILES)
