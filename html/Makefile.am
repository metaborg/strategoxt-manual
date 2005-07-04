include $(top_srcdir)/Makefile.docbook

XSLTPROC_FLAGS = --param html.stylesheet \'style.css\' \
                 --param use.id.as.filename \'1\' --param chunk.section.depth \'0\' \
                 --param toc.max.depth \'3\'

BOOK = $(top_srcdir)/doc/book
pkgdata_DATA = index.html manual.html $(wildcard *.html) examples.tar.gz
CLEANFILES = $(wildcard *.html)

EXTRA_DIST = $(wildcard *.html)

examples.tar.gz : ../src/examples.tar.gz
	cp $< $@
