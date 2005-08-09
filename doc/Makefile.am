include $(top_srcdir)/Makefile.docbook

noinst_DATA = book.docbook

book.xml-exp1 : */*.xml

EXTRA_DIST = $(wildcard *.xml) book.docbook
CLEANFILES = book.docbook book.xml-included book.xml-expanded book.xml-included1

