ACLOCAL_AMFLAGS = -I .
SUBDIRS    = src doc html man pdf
EXTRA_DIST = bootstrap docbook.m4 Makefile.docbook

relname:
	echo -n $(distdir) > relname

doc-only : 
	cd doc; $(MAKE)
	cd html; $(MAKE)
	cd man; $(MAKE)

.PHONY : mandist

mandist:
	rm -rf mandist
	mkdir mandist
	mkdir mandist/$(distdir)
	cp html/*.css html/*.html mandist/$(distdir)
	cd doc && find . -name *.png | xargs -i cp --parents {} ../mandist/$(distdir)
	cp src/examples.tar.gz mandist/$(distdir)
	cd mandist && tar cvfj $(distdir).tar.bz2 $(distdir)
	cd mandist && tar cvfz $(distdir).tar.gz $(distdir)
	cd mandist && zip -r $(distdir).zip $(distdir)
	cd mandist && mv $(distdir) manual && tar cvfj manual.tar.bz2 manual
	cp mandist/manual.tar.bz2 .
	rm -rf mandist/$(distdir)
	rm -rf mandist/manual

