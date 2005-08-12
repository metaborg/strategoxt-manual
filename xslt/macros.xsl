<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
                version="1.0"
                exclude-result-prefixes="exsl">

  <xsl:output 
    method="xml" 
    doctype-public="-//OASIS//DTD DocBook XML V4.3//EN" 
    doctype-system="http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd" />

  <xsl:template match="includexml">
     <include href="{@file}" xmlns="http://www.w3.org/2003/XInclude"/>
  </xsl:template>

  <xsl:template match="includefile">
    <figure id="{@id}">
      <title>file: <ulink url="examples-full/{@file}"><xsl:value-of select="@file" /></ulink></title>
      <screen><include parse="text"
        href="{@root}/{@file}"
        xmlns="http://www.w3.org/2003/XInclude"/></screen>
    </figure>
  </xsl:template>

  <xsl:template match="beforeafter">
    <table frame='none'>
      <title>files: <ulink url="examples-full/{@file1}"><xsl:value-of
         select="@file1" /></ulink>, <ulink
         url="examples-full/{@file2}"><xsl:value-of select="@file2"
         /></ulink></title>
      <tgroup cols='2' align='center' colsep='1' rowsep='1'>
        <colspec colname='before'/>
        <colspec colname='after'/>
        <thead>
          <row>
            <entry>before</entry>
            <entry>after</entry>
          </row>
        </thead>
        <tbody>
          <row>
            <entry align="left"><screen><include parse="text"
            href="{@root}/{@file1}"
            xmlns="http://www.w3.org/2003/XInclude"/></screen></entry>
            <entry align="left"><screen><include parse="text"
            href="{@root}/{@file2}"
            xmlns="http://www.w3.org/2003/XInclude"/></screen></entry>
          </row>
        </tbody>
      </tgroup>
    </table>
  </xsl:template>

  <xsl:template match="nexttoeachother">
    <informaltable frame='none'>
      <tgroup cols='2' align='center' colsep='1' rowsep='1'>
        <tbody>
          <row>
            <xsl:apply-templates/>
          </row>
        </tbody>
      </tgroup>
    </informaltable>
  </xsl:template>


  <xsl:template match="showfile">
      <screen><include parse="text"
        href="{@root}/{@file}"
        xmlns="http://www.w3.org/2003/XInclude"/></screen>
  </xsl:template>


  <xsl:template match="linkfile">
    <ulink url="examples-full/{@file}"><xsl:value-of select="@file" /></ulink>
  </xsl:template>

  <xsl:template match="pngobject">
    <mediaobject>
      <imageobject role="html">
        <imagedata format="PNG" fileref="{@fileref}" align="{@align}"/>
      </imageobject>
    </mediaobject>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
