include $(top_srcdir)/Makefile.docbook

XSLTPROC_FLAGS = --param html.stylesheet \'style.css\' --param use.id.as.filename \'1\'

BOOK = $(top_srcdir)/doc/book
noinst_DATA = index.html manual.html
CLEANFILES = $(wildcard *.html)