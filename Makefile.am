ACLOCAL_AMFLAGS = -I .
SUBDIRS    = src doc svg html man pdf
EXTRA_DIST = bootstrap docbook.m4 Makefile.docbook

relname:
	echo -n $(distdir) > relname

html-only :
	cd doc; $(MAKE)
	cd html; $(MAKE)

doc-only : 
	cd doc; $(MAKE)
	cd html; $(MAKE)
	cd man; $(MAKE)

.PHONY : manual mandist

# Create a complete manual in the dir mandist/manual
manual :
	cd doc && $(MAKE)
	cd svg && $(MAKE)
	rm -rf mandist
	source $(top_srcdir)/prepare-manual.sh && prepare_manual "chunk-chapter"
	source $(top_srcdir)/prepare-manual.sh && prepare_manual "chunk-part"
	source $(top_srcdir)/prepare-manual.sh && prepare_manual "chunk-book"
	source $(top_srcdir)/prepare-manual.sh && prepare_manual "one-page"
	cp html/*.html mandist/manual

# Creates several distributions of the manual
mandist: manual
	cd mandist && tar cvfj manual.tar.bz2 manual
	mv mandist/manual.tar.bz2 .
	source $(top_srcdir)/prepare-manual.sh && prepare_mandist "chunk-chapter"
	source $(top_srcdir)/prepare-manual.sh && prepare_mandist "chunk-part"
	source $(top_srcdir)/prepare-manual.sh && prepare_mandist "chunk-book"
	source $(top_srcdir)/prepare-manual.sh && prepare_mandist "one-page"
	rm -rf mandist/manual
