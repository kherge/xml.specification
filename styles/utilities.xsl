<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:spec="urn:kherge:specification"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
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

  <!-- Add titles to links to use cases and requirements. -->
  <xsl:template match="//xhtml:a[starts-with(text(), 'FR-') or starts-with(text(), 'NFR-') or starts-with(text(), 'UC-')]" mode="copy">
    <xsl:variable name="id" select="."/>
    <xsl:variable name="ref" select="//spec:use-case[spec:number/text() = $id] | //spec:requirement[spec:number/text() = $id]"/>
    <a data-toggle="tooltip" href="{@href}" title="{$ref/spec:name}">
      <xsl:value-of select="."/>
    </a>
  </xsl:template>

</xsl:stylesheet>
