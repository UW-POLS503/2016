SLIDES_RMD := $(wildcard *.Rmd)
SLIDES_PDF = $(SLIDES_RMD:%.Rmd=%.pdf)

all: $(SLIDES_PDF)

%.pdf: %.Rmd
	Rscript -e 'rmarkdown::render("$<",output_format="beamer_presentation")'
