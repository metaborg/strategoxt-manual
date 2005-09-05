include $(top_srcdir)/Makefile.docbook

XSLTPROC_FLAGS =					 \
	--param html.stylesheet \'style.css\'		 \
        --param use.id.as.filename \'1\'		 \
	--param chunk.section.depth \'0\'		 \
        --param chunk.fast \'1\'                         \
        --param toc.max.depth \'3\'			 \
	--param toc.section.depth 2			 \
	--param xref.with.number.and.title 1		 \
	--param section.label.includes.component.label 2 \
	--param section.autolabel 1

BOOK = $(top_srcdir)/doc/book

pkgdata_DATA = index.html $(wildcard *.html)  $(wildcard *.png) \
	examples.tar.gz examples-full.tar.gz 

CLEANFILES = $(wildcard *.html)

EXTRA_DIST = $(wildcard *.html) examples.tar.gz examples-full.tar.gz

examples.tar.gz : ../src/examples.tar.gz
	cp $< $@
	tar zxf examples.tar.gz

examples-full.tar.gz : ../src/examples-full.tar.gz
	cp $< $@
	tar zxf examples-full.tar.gz
