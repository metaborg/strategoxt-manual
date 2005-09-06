ACLOCAL_AMFLAGS = -I .
SUBDIRS    = src doc html man pdf
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
	cd doc; $(MAKE)
	cd html; $(MAKE)
	rm -rf mandist
	mkdir mandist
	mkdir mandist/manual
	cp html/*.css html/*.html mandist/manual
	cd doc && find . \
           -name *.png -or \
           -name *.str -or \
           -name *.sdf -or \
           -name *.str -or \
           -name *.rtg -or \
           -name *.pp -or \
           -name *.meta | xargs -i cp --parents {} ../mandist/manual
	cp src/examples.tar.gz mandist/manual
	cd mandist/manual && tar zxvf ../../src/examples-full.tar.gz

# Creates several distributions of the manual
mandist: manual
	cd mandist && tar cvfj manual.tar.bz2 manual
	mv mandist/manual.tar.bz2 .
	cd mandist && mv manual $(distdir)
	cd mandist && tar cvfj $(distdir).tar.bz2 $(distdir)
	cd mandist && tar cvfz $(distdir).tar.gz $(distdir)
	cd mandist && zip -r $(distdir).zip $(distdir)
