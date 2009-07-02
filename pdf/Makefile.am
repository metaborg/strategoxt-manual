include $(top_srcdir)/Makefile.docbook

BOOK = $(top_srcdir)/doc/book.docbook
EXTRA_DIST = book.pdf
noinst_DATA = book.pdf
CLEANFILES  = book.pdf

images :
	mkdir images
	for pic in `find $(top_srcdir) -name *.png`; \
	do \
		convert -background white -layers merge $$pic images/`basename $$pic` ; \
	done
	mkdir images/xmpl
	for pic in `find $(top_srcdir)/todo/program-representation-xmpl/ -name *.png`; \
	do \
		convert -background white -layers merge $$pic images/`basename $$pic` ; \
	done 

# Sorry this is not autoconfigured until it actually works.
book.pdf : $(BOOK) images
	dblatex $(BOOK) -o book.pdf -I images

