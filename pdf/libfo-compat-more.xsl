<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  version="1.0">

  <xsl:output method="xml"/>
  
  <!-- Unsupported properties to be removed. -->
  <xsl:template match="@span | @border-before-width.conditionality">
    <xsl:message>Removing unsupported '<xsl:value-of select="name()"/>' property.</xsl:message>
  </xsl:template>

  <xsl:template match="fo:table">
    <xsl:message>Removing unsupported '<xsl:value-of select="name()"/>'.</xsl:message>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:attribute name="{name()}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
