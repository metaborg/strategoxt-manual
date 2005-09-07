include $(top_srcdir)/Makefile.docbook

noinst_DATA = $(PNG)

PNG = \
  tutorial/introduction/pipe.png \
  tutorial/xt/architecture/contracts.png \
  tutorial/xt/architecture/simple-expr-tree.png

rasterclean :
	rm -f $(PNG)

RASTERIZE = $(JAVA) -jar $(BATIK)/batik-rasterizer.jar

# Rasterize rules
# ---------------
# We really need target specific variables here, but I don't know how to do that.

tutorial/xt/architecture/contracts.png : tutorial/xt/architecture/contracts.svg
	$(RASTERIZE) -w 600 -h 450 $<

tutorial/introduction/pipe.png : tutorial/introduction/pipe.svg
	$(RASTERIZE) -w 600 -h 350 $<

tutorial/xt/architecture/simple-expr-tree.png : tutorial/xt/architecture/simple-expr-tree.svg
	$(RASTERIZE) -w 225 -h 225 $<

# Generic rules

%.svg : %.dot
	dot -Tsvg -o$@ $<
