include $(top_srcdir)/Makefile.docbook

XSLTPROC_FLAGS =					 \
	--param html.stylesheet \'style.css\'		 \
        --param use.id.as.filename \'1\'		 \
	--param chunk.chapter \'0\'		         \
	--param chunk.part \'0\'		         \
	--param chunk.book \'1\'		         \
	--param chunk.section.depth \'0\'		 \
        --param toc.max.depth \'3\'			 \
	--param toc.section.depth 2			 \
	--param xref.with.number.and.title 0		 \
	--param section.label.includes.component.label 2 \
	--param section.autolabel 1

CHUNK = true
BOOK = $(top_srcdir)/doc/book

noinst_DATA = index.html
CLEANFILES = $(wildcard *.html)
EXTRA_DIST = $(wildcard *.html)
