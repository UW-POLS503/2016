# POLS 503 (Spring 2016)

[![Join the chat at https://gitter.im/UW-POLS503/pols_503_sp16](https://badges.gitter.im/UW-POLS503/pols_503_sp16.svg)](https://gitter.im/UW-POLS503/pols_503_sp16?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Repository containing materials for POLS 503: Advanced Quantitative Political Methodology (University of Washington, Spring 2016).

## Build

The website is generated from `.Rmd` files and a Makefile, as described in [here](http://rmarkdown.rstudio.com/html_document_format.html#creating_a_website).
To build the website run
```console
$ make html
```
To cleanup all the html files
```console
$ make clean
```

To build whenever a file changes, install [watchman](https://facebook.github.io/watchman/) and run
```console
$ make watch
```
To stop watching for file changes
```console
$ make unwatch
```

To preview the site while working on it, any simple server will work.
The simple web server included in the `http.server` module in Python 3 is one example:
```console
python -m http.server 8000
```

## Configuration

To change the R configuration used in all R documents, edit the `.Rprofile` file which
is loaded whenever R is run in this directory.

To change the R Markdown output configuration, edit `_output.yaml`.
See the [R Markdown](http://rmarkdown.rstudio.com/html_document_format.html#pandoc_arguments) documentation for more information.

## Updating

### Lessons

To add a new Lessons

1. Create a new file named `lesson_*.Rmd`
2. Edit `_navbar.html` to add the lesson the navigation bar. There is a comment indicating the correction location to add it.
