
all : examples.tar.gz
	(cd til; ./maak)

EXTRA_DIST = `find til -type f -a -print | grep -v .svn | grep -v \*~`

examples.tar.gz : 
	mkdir -p examples
	cp -fr til examples
	tar zcf examples.tar.gz examples

