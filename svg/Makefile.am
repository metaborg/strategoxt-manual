include $(top_srcdir)/Makefile.docbook

noinst_DATA = \
  tutorial/xt/architecture/contracts.png

RASTERIZE = $(JAVA) -jar $(BATIK)/batik-rasterizer.jar

# We really need target specific variables here, but I don't know how to do that.

tutorial/xt/architecture/contracts.png : tutorial/xt/architecture/contracts.svg
	$(RASTERIZE) -w 600 -h 500 $<
