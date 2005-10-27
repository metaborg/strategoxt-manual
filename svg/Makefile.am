include $(top_srcdir)/Makefile.docbook

noinst_DATA = $(PNG)

PNG = \
  tutorial/introduction/pipe.png \
  tutorial/xt/architecture/contracts.png \
  tutorial/xt/architecture/simple-expr-tree.png \
  tutorial/xt/terms/sharing-tree.png \
  tutorial/xt/terms/sharing-graph.png \
  tutorial/xt/parsing/Plus.png \
  tutorial/xt/parsing/PlusTimes.png \
  tutorial/xt/parsing/parse-tree.png \
  tutorial/xt/parsing/abstract-syntax-tree.png

rasterclean :
	rm -f $(PNG)

# Target specific size

tutorial/introduction/pipe.png : SIZE = -w 600 -h 350

tutorial/xt/architecture/contracts.png        : SIZE = -w 600 -h 450
tutorial/xt/architecture/simple-expr-tree.png : SIZE = -w 225 -h 225

tutorial/xt/terms/sharing-tree.png  : SIZE = -w 275 -h 275
tutorial/xt/terms/sharing-graph.png : SIZE = -w 275 -h 275

tutorial/xt/parsing/Plus.png       : SIZE = -w 600 -h 125
tutorial/xt/parsing/PlusTimes.png  : SIZE = -w 225 -h 200
tutorial/xt/parsing/parse-tree.png : SIZE = -w 275 -h 400
tutorial/xt/parsing/abstract-syntax-tree.png : SIZE = -w 225 -h 225

# Generic rules

RASTERIZE = $(JAVA) -jar $(BATIK)/batik-rasterizer.jar

%.png : %.svg
	$(RASTERIZE) $(SIZE) $<

%.svg : %.dot
	dot -Tsvg -o$@ $<
