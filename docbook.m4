AC_DEFUN([USE_DOCBOOK], [

  # DocBook XML

  AC_ARG_WITH(docbook-xml, 
    AC_HELP_STRING([--with-docbook-xml=DIR], [use DocBook XML at DIR @<:@PREFIX@:>@]), 
    DOCBOOK_XML="$withval", 
    DOCBOOK_XML="$prefix"
  )
  AC_SUBST(DOCBOOK_XML)

  DOCBOOK_RNG=$DOCBOOK_XML/xml/rng/docbook/docbook.rng
  AC_CHECK_FILE($DOCBOOK_RNG,
    DOCBOOK_RNG_WORKS=yes; AC_SUBST(DOCBOOK_RNG),
    DOCBOOK_RNG_WORKS=
  )

  DOCBOOKXI_RNG=$DOCBOOK_XML/xml/rng/docbook/docbookxi.rng
  AC_CHECK_FILE($DOCBOOKXI_RNG,
    DOCBOOKXI_RNG_WORKS=yes; AC_SUBST(DOCBOOKXI_RNG),
    DOCBOOKXI_RNG_WORKS=
  )

# DocBook XSL

  AC_ARG_WITH(docbook-xsl, 
    AC_HELP_STRING([--with-docbook-xsl=DIR], [use DocBook XSL at DIR @<:@PREFIX@:>@]), 
    DOCBOOK_XSL="$withval", 
    DOCBOOK_XSL="$prefix"
  )
  AC_SUBST(DOCBOOK_XSL)

  # html
  DOCBOOK2HTML_XSL=$DOCBOOK_XSL/xml/xsl/docbook/html/docbook.xsl
  AC_CHECK_FILE($DOCBOOK2HTML_XSL,
    DOCBOOK2HTML_WORKS=yes; AC_SUBST(DOCBOOK2HTML_XSL),
    DOCBOOK2HTML_WORKS=
  )

  # html chunk
  DOCBOOK2HTML_CHUNK_XSL=$DOCBOOK_XSL/xml/xsl/docbook/html/chunk.xsl
  AC_CHECK_FILE($DOCBOOK2HTML_CHUNK_XSL,
    DOCBOOK2HTML_CHUNK_WORKS=yes; AC_SUBST(DOCBOOK2HTML_CHUNK_XSL),
    DOCBOOK2HTML_CHUNK_WORKS=
  )

  # xhtml
  DOCBOOK2XHTML_XSL=$DOCBOOK_XSL/xml/xsl/docbook/xhtml/docbook.xsl
  AC_CHECK_FILE($DOCBOOK2XHTML_XSL,
    DOCBOOK2XHTML_WORKS=yes; AC_SUBST(DOCBOOK2XHTML_XSL),
    DOCBOOK2XHTML_WORKS=
  )

  # xhtml chunk
  DOCBOOK2XHTML_CHUNK_XSL=$DOCBOOK_XSL/xml/xsl/docbook/xhtml/chunk.xsl
  AC_CHECK_FILE($DOCBOOK2XHTML_CHUNK_XSL,
    DOCBOOK2XHTML_CHUNK_WORKS=yes; AC_SUBST(DOCBOOK2XHTML_CHUNK_XSL),
    DOCBOOK2XHTML_CHUNK_WORKS=
  )

  # man
  DOCBOOK2MAN_XSL=$DOCBOOK_XSL/xml/xsl/docbook/manpages/docbook.xsl
  AC_CHECK_FILE($DOCBOOK2MAN_XSL,
    DOCBOOK2MAN_WORKS=yes; AC_SUBST(DOCBOOK2MAN_XSL),
    DOCBOOK2MAN_WORKS=
  )

  DOCBOOKSTRIPNS_XSL=$DOCBOOK_XSL/xml/xsl/docbook/manpages/stripns.xsl
  AC_CHECK_FILE($DOCBOOKSTRIPNS_XSL,
    DOCBOOKSTRIPNS_WORKS=yes; AC_SUBST(DOCBOOKSTRIPNS_XSL),
    DOCBOOKSTRIPNS_WORKS=
  )

# xsltproc

  if test -n "$DOCBOOK2HTML_WORKS"; then 
    AC_CHECK_PROG(XSLTPROC,xsltproc,xsltproc,)

    XSLTPROC_WORKS=no
    if test -n "$XSLTPROC"; then
            AC_MSG_CHECKING([whether xsltproc works])
  
            $XSLTPROC --noout $DOCBOOK2HTML_XSL << END
<?xml version="1.0" encoding='ISO-8859-1'?>
<book id="test">
</book>
END
            if test "$?" = 0; then
                    XSLTPROC_WORKS=yes
            fi
            AC_MSG_RESULT($XSLTPROC_WORKS)
    fi
  fi

  AC_CHECK_PROG(XMLLINT,xmllint,xmllint,)

# jing

  AC_CHECK_PROG(JING,jing,jing,)

  JING_WORKS=no
  if test -n "$JING"; then
    AC_MSG_CHECKING([whether jing works])

    echo '<section xml:id="test" xmlns="http://docbook.org/ns/docbook"><title>foo</title><para/></section>' > jingtest.xml
  
    $JING $DOCBOOK_RNG jingtest.xml
    if test "$?" = 0; then
      JING_WORKS=yes
    fi
    rm -f jing-test.xml
    AC_MSG_RESULT($JING_WORKS)
  fi

# conclusion

  AC_MSG_CHECKING([whether all docbook stuff is available])
  DOCBOOK_WORKS=no
  if test "$DOCBOOK_RNG_WORKS $DOCBOOKXI_RNG_WORKS $DOCBOOK2XHTML_WORKS \
$DOCBOOK2XHTML_CHUNK_WORKS $DOCBOOK2HTML_WORKS $DOCBOOK2HTML_CHUNK_WORKS \
$DOCBOOK2MAN_WORKS $DOCBOOKSTRIPNS_WORKS $XSLTPROC_WORKS $JING_WORKS" \
= "yes yes yes yes yes yes yes yes yes yes"; then
    DOCBOOK_WORKS=yes
  fi

  AC_MSG_RESULT($DOCBOOK_WORKS)

  if test "$DOCBOOK_WORKS" != "yes"; then
    AC_MSG_ERROR([cannot find all the docbook stuff.])
  fi
])


AC_DEFUN([USE_DB2LATEX], [
  AC_ARG_WITH(db2latex, 
    AC_HELP_STRING([--with-db2latex=DIR], [use DB2LaTeX at DIR @<:@PREFIX@:>@]), 
    DB2LATEX="$withval", 
    DB2LATEX="$prefix"
  )
  AC_SUBST(DB2LATEX)

  DOCBOOK2LTX_XSL=$DB2LATEX/xsl/docbook.xsl
  AC_CHECK_FILE($DOCBOOK2LTX_XSL,
    DOCBOOK2LTX_WORKS=yes; AC_SUBST(DOCBOOK2LTX_XSL),
    DOCBOOK2LTX_WORKS=
  )
])