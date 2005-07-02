ACLOCAL_AMFLAGS = -I .
SUBDIRS    = src doc html 
EXTRA_DIST = bootstrap docbook.m4 Makefile.docbook

relname:
	echo -n $(distdir) > relname

doc-only : 
	cd doc; $(MAKE)
	cd html; $(MAKE)
