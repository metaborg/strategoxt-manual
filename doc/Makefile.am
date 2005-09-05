include $(top_srcdir)/Makefile.docbook

noinst_DATA = book.docbook 

ALL_XML_FILES = \
  $(wildcard */*.xml) \
  $(wildcard */*/*.xml) \
  $(wildcard */*/*/*.xml)

EXTRA_DIST = $(wildcard *.xml) book.docbook
CLEANFILES = book.docbook book.xml-inc book.xml-exp book.xml-inc? book.xml-exp?

