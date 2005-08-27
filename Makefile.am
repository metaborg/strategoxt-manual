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
	rm -rf mandist
	mkdir mandist
	mkdir mandist/manual
	cp html/*.css html/*.html mandist/manual
	cd doc && find . -name *.png | xargs -i cp --parents {} ../mandist/manual
	cd mandist && tar cvfj manual.tar.bz2 manual
	cd mandist && tar cvfz manual.tar.gz manual
	cd mandist && zip manual.zip manual
	rm -rf mandist/manual
