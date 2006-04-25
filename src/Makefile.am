
all : examples.tar.gz
	cd til && ./maak
	$(MAKE) examples-full.tar.gz

EXTRA_DIST =					\
	$(wildcard til/*/maak)			\
	$(wildcard til/*/maak-clean)		\
	$(wildcard til/*/*.grm)			\
	$(wildcard til/*/*.sdf)			\
	$(wildcard til/*/*.str)			\
	$(wildcard til/*/*.pp)			\
	$(wildcard til/*/*-test*)		\
	$(wildcard til/*/*.til) 

examples.tar.gz : 
	mkdir -p examples
	cp -fr til examples
	tar zcf examples.tar.gz examples

examples-full.tar.gz : 
	mkdir -p examples-full
	cp -fr til examples-full
	tar zcf examples-full.tar.gz examples-full
