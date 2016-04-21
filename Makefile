RMD_FILES = $(wildcard *.Rmd)
HTML_FILES = $(RMD_FILES:%.Rmd=%.html)
HTML_FILES_DEPENDS = $(wildcard include/*) _navbar.html _output.yaml .Rprofile pols503.css

all: html

html: $(HTML_FILES)

%.html: %.Rmd $(HTML_FILES_DEPENDS)
	-R --slave -e "rmarkdown::render('$<',encoding='UTF-8')"

watch:
	watchman watch "$(shell pwd)"
	watchman -- trigger "$(shell pwd)" website $(RMD_FILES) $(HTML_FILES_DEPENDS) Makefile -- make html
	watchman -- trigger "$(shell pwd)" slides slides/*.Rmd slides/Makefile -- make -C slides all

unwatch:
	watchman watch-del "$(shell pwd)"

.PHONY: clean
clean:
	-rm -rf *_cache *_files

.PHONY: clean-all
clean-all: clean
	-rm -rf $(HTML_FILES)
