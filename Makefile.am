ACLOCAL_AMFLAGS = -I .
SUBDIRS    = src doc html man pdf
EXTRA_DIST = bootstrap docbook.m4 Makefile.docbook

relname:
	echo -n $(distdir) > relname

doc-only : 
	cd doc; $(MAKE)
	cd html; $(MAKE)
	cd man; $(MAKE)

mandist:
	rm -rf manual
	mkdir manual
	cp html/*.css html/*.html manual
	cd doc && find . -name *.png | xargs -i cp --parents {} ../manual
	tar cvfj manual.tar.bz2 manual
