<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
		version="1.0"
                exclude-result-prefixes="exsl">

<!-- ********************************************************************
     $Id: chunk.xsl,v 1.30 2003/11/30 19:42:23 bobstayton Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->

<xsl:import href="docbook.xsl"/>
<xsl:import href="chunk-common.xsl"/>
<xsl:include href="manifest.xsl"/>

<!-- Why is chunk-code now xsl:included?

Suppose you want to customize *both* the chunking algorithm used *and* the
presentation of some elements that may be chunks. In order to do that, you
must get the order of imports "just right". The answer is to make your own
copy of this file, where you replace the initial import of "docbook.xsl"
with an import of your own base.xsl (that does its own import of docbook.xsl).

Put the templates for changing the presentation of elements in your base.xsl.

Put the templates that control chunking after the include of chunk-code.xsl.

Voila! (Man I hope we can do this better in XSLT 2.0)

-->

<xsl:include href="chunk-code.xsl"/>

<xsl:param name="chunk.book" value="1"/>
<xsl:param name="chunk.part" value="1"/>
<xsl:param name="chunk.chapter" value="1"/>

<xsl:template match="book">
  <xsl:choose>
    <xsl:when test="$chunk.book = 1">
      <xsl:call-template name="my-chunk-first-section-with-parent"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="part">
  <xsl:choose>
    <xsl:when test="$chunk.part = 1">
      <xsl:call-template name="my-chunk-first-section-with-parent"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="chapter">
  <xsl:choose>
    <xsl:when test="$chunk.chapter = 1">
      <xsl:call-template name="my-chunk-first-section-with-parent"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="my-chunk-first-section-with-parent">
  <xsl:param name="content">
    <xsl:apply-imports/>
  </xsl:param>

  <xsl:variable name="prev"
    select="(preceding::book[1]
             |preceding::preface[1]
             |preceding::chapter[$chunk.chapter = 1 and position() = 1]
             |preceding::appendix[1]
             |preceding::part[$chunk.part = 1 and position() = 1]
             |preceding::reference[1]
             |preceding::refentry[1]
             |preceding::colophon[1]
             |preceding::article[1]
             |preceding::bibliography[parent::article or parent::book or parent::part][1]
             |preceding::glossary[parent::article or parent::book or parent::part][1]
             |preceding::index[$generate.index != 0]
	                       [parent::article or parent::book or parent::part][1]
             |preceding::setindex[$generate.index != 0][1]
             |ancestor::set
             |ancestor::book[1]
             |ancestor::preface[1]
             |ancestor::chapter[$chunk.chapter = 1 and position() = 1]
             |ancestor::appendix[1]
             |ancestor::part[$chunk.part = 1 and position() = 1]
             |ancestor::reference[1]
             |ancestor::article[1])[last()]"/>

  <xsl:variable name="next"
    select="(following::book[1]
             |following::preface[1]
             |following::chapter[$chunk.chapter = 1 and position() = 1]
             |following::appendix[1]
             |following::part[$chunk.part = 1 and position() = 1]
             |following::reference[1]
             |following::refentry[1]
             |following::colophon[1]
             |following::bibliography[parent::article or parent::book or parent::part][1]
             |following::glossary[parent::article or parent::book or parent::part][1]
             |following::index[$generate.index != 0]
	                       [parent::article or parent::book or parent::part][1]
             |following::article[1]
             |following::setindex[$generate.index != 0][1]
             |descendant::book[1]
             |descendant::preface[1]
             |descendant::chapter[$chunk.chapter = 1 and position() = 1]
             |descendant::appendix[1]
             |descendant::article[1]
             |descendant::bibliography[parent::article or parent::book or parent::part][1]
             |descendant::glossary[parent::article or parent::book or parent::part][1]
             |descendant::index[$generate.index != 0]
	                       [parent::article or parent::book or parent::part][1]
             |descendant::colophon[1]
             |descendant::setindex[$generate.index != 0][1]
             |descendant::part[$chunk.part = 1 and position() = 1]
             |descendant::reference[1]
             |descendant::refentry[1])[1]"/>

  <xsl:call-template name="process-chunk">
    <xsl:with-param name="prev" select="$prev"/>
    <xsl:with-param name="next" select="$next"/>
    <xsl:with-param name="content" select="$content"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="chunk">
  <xsl:param name="node" select="."/>
  <!-- returns 1 if $node is a chunk -->

  <xsl:choose>
    <xsl:when test="not($node/parent::*)">1</xsl:when>

    <xsl:when test="local-name($node)='preface'">1</xsl:when>
    <xsl:when test="local-name($node)='chapter'"><xsl:value-of select="$chunk.chapter"/></xsl:when>
    <xsl:when test="local-name($node)='appendix'">1</xsl:when>
    <xsl:when test="local-name($node)='article'">1</xsl:when>
    <xsl:when test="local-name($node)='part'"><xsl:value-of select="$chunk.part"/></xsl:when>
    <xsl:when test="local-name($node)='reference'">1</xsl:when>
    <xsl:when test="local-name($node)='refentry'">1</xsl:when>
    <xsl:when test="local-name($node)='index' and $generate.index != 0
                    and (local-name($node/parent::*) = 'article'
                    or local-name($node/parent::*) = 'book'
                    or local-name($node/parent::*) = 'part'
                    )">1</xsl:when>
    <xsl:when test="local-name($node)='bibliography'
                    and (local-name($node/parent::*) = 'article'
                    or local-name($node/parent::*) = 'book'
                    or local-name($node/parent::*) = 'part'
                    )">1</xsl:when>
    <xsl:when test="local-name($node)='glossary'
                    and (local-name($node/parent::*) = 'article'
                    or local-name($node/parent::*) = 'book'
                    or local-name($node/parent::*) = 'part'
                    )">1</xsl:when>
    <xsl:when test="local-name($node)='colophon'">1</xsl:when>
    <xsl:when test="local-name($node)='book'"><xsl:value-of select="$chunk.book"/></xsl:when>
    <xsl:when test="local-name($node)='set'">1</xsl:when>
    <xsl:when test="local-name($node)='setindex'">1</xsl:when>
    <xsl:when test="local-name($node)='legalnotice'
                    and $generate.legalnotice.link != 0">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>


</xsl:stylesheet>
