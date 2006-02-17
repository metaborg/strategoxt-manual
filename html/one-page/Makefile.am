include $(top_srcdir)/Makefile.docbook

XSLTPROC_FLAGS =					 \
	--param html.stylesheet \'style.css\'		 \
        --param toc.max.depth \'3\'			 \
	--param toc.section.depth 2			 \
	--param xref.with.number.and.title 0		 \
	--param section.label.includes.component.label 2 \
	--param section.autolabel 1

CHUNK = false
BOOK = $(top_srcdir)/doc/book

noinst_DATA = index.html
CLEANFILES = $(wildcard *.html)
EXTRA_DIST = $(wildcard *.html)
