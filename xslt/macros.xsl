<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns="http://docbook.org/ns/docbook"
  xmlns:db="http://docbook.org/ns/docbook"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xi="http://www.w3.org/2003/XInclude">

  <xsl:output method="xml"/>
  
  <xsl:template match="db:includefile">
    <figure>
      <xsl:attribute name="id" namespace="http://www.w3.org/XML/1998/namespace">
	<xsl:value-of select="@id"/>
      </xsl:attribute>
      <title>file: <ulink url="examples-full/{@file}"><xsl:value-of select="@file" /></ulink></title>
      <screen><xi:include parse="text" href="{@root}/{@file}"/></screen>
    </figure>
  </xsl:template>

  <xsl:template match="db:beforeafter">
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
            <entry align="left"><screen><xi:include parse="text" href="{@root}/{@file1}"/></screen></entry>
            <entry align="left"><screen><xi:include parse="text" href="{@root}/{@file2}"/></screen></entry>
          </row>
        </tbody>
      </tgroup>
    </table>
  </xsl:template>

  <xsl:template match="db:nexttoeachother">
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

  <xsl:template match="db:showfile">
    <screen><xi:include parse="text" href="{@root}/{@file}"/></screen>
  </xsl:template>
    
  <xsl:template match="db:linkfile">
    <ulink url="examples-full/{@file}"><xsl:value-of select="@file" /></ulink>
  </xsl:template>
  
  <xsl:template match="db:pngobject">
    <mediaobject>
      <imageobject role="html">
	<imagedata format="PNG" fileref="{@fileref}" align="{@align}"/>
      </imageobject>
    </mediaobject>
  </xsl:template>

  <xsl:template match="*">
    <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
      <xsl:copy-of select="namespace::*" />
      <xsl:for-each select="@*">
	<xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
	  <xsl:value-of select="."/>
	</xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
