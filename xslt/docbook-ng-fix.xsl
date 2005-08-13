<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns="http://docbook.org/ns/docbook"
  xmlns:db="http://docbook.org/ns/docbook"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml"/>

  <xsl:template match="*">
    <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
      <xsl:copy-of select="namespace::*" />
      <xsl:for-each select="@*">
	<xsl:choose>
	  <!-- strip xml:id to id. docbook-xsl cannot handle xml:id -->
	  <xsl:when test="local-name(.) = 'id' and namespace-uri(.) = 'http://www.w3.org/XML/1998/namespace'">
	    <xsl:attribute name="id">
	      <xsl:value-of select="."/>
	    </xsl:attribute>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
	      <xsl:value-of select="."/>
	    </xsl:attribute>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:for-each>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
