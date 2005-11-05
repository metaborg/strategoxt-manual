include $(top_srcdir)/Makefile.docbook

BOOK = $(top_srcdir)/doc/book

# noinst_DATA = book.fo
CLEANFILES  = book.fo

# Sorry this is not autoconfigured until it actually works.

%.pdf : %.foxmlroff
	xmlroff $< -o $@ -format=pdf

%.focompat : %.fo
	$(XSLTPROC) $(XSLTPROC_FLAGS) --output $@ ${HOME}/.nix-profile/share/xml/libfo-0.3.5/libfo-compat.xsl $<

%.foxmlroff : %.focompat
	$(XSLTPROC) $(XSLTPROC_FLAGS) --output $@ ./libfo-compat-more.xsl $<
