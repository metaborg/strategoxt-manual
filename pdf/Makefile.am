include $(top_srcdir)/Makefile.docbook

BOOK = $(top_srcdir)/doc/book.docbook
EXTRA_DIST = book.pdf
noinst_DATA = book.pdf
CLEANFILES  = book.pdf

images :
	mkdir images
	find $(top_srcdir) -name *.png | xargs -I{} cp {} images/
	mkdir images/xmpl
	cp $(top_srcdir)/todo/program-representation-xmpl/*.png images/xmpl/

# Sorry this is not autoconfigured until it actually works.
book.pdf : $(BOOK) images
	dblatex $(BOOK) -o book.pdf -I images

