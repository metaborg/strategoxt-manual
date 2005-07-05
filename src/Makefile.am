
all : examples.tar.gz
	-(cd til; ./maak)
	$(MAKE) examples-full.tar.gz

EXTRA_DIST = `find til -type f -a -print | grep -v .svn | grep -v \*~`

examples.tar.gz : 
	mkdir -p examples
	cp -fr til examples
	tar zcf examples.tar.gz examples

examples-full.tar.gz : 
	mkdir -p examples-full
	cp -fr til examples-full
	tar zcf examples-full.tar.gz examples-full
