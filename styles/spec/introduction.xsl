<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:spec="urn:kherge:specification"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

  <!-- Render all of the introduction. -->
  <xsl:template match="spec:introduction">
    <h2 id="_intro">Introduction</h2>
    <xsl:apply-templates/>
    <div class="page-break"/>
  </xsl:template>

  <!-- Add a header and render the purpose. -->
  <xsl:template match="spec:introduction/spec:purpose">
    <h3 id="_intro_purpose">Purpose</h3>
    <xsl:apply-templates mode="copy"/>
  </xsl:template>

  <!-- Add a header and render the scope. -->
  <xsl:template match="spec:introduction/spec:scope">
    <h3 id="_intro_scope">Scope</h3>
    <xsl:apply-templates mode="copy"/>
  </xsl:template>

  <!-- Add a header and render the system overview. -->
  <xsl:template match="spec:introduction/spec:overview">
    <h3 id="_intro_overview">System Overview</h3>
    <xsl:apply-templates mode="copy"/>
  </xsl:template>

  <!-- Add a header and render the references. -->
  <xsl:template match="spec:introduction/spec:references">
    <h3 id="_intro_references">References</h3>
    <ol>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>

  <!-- Each individual reference is a link to a new window. -->
  <xsl:template match="spec:introduction/spec:references/spec:reference">
    <li>
      <a href="{./spec:link}" target="_blank">
        <xsl:value-of select="./spec:text"/>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>
