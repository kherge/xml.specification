<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

  <!-- Only use the local name of the node. -->
  <xsl:template match="*" mode="copy">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@*|node()" mode="copy" />
    </xsl:element>
  </xsl:template>

  <!-- Copy as is. -->
  <xsl:template match="@*|text()|comment()" mode="copy">
    <xsl:copy/>
  </xsl:template>

</xsl:stylesheet>
