<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:spec="urn:kherge:specification"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

  <!-- Ignore the project information. -->
  <xsl:template match="spec:project" mode="toc"/>

  <!-- Render the introduction for the table of contents. -->
  <xsl:template match="spec:introduction" mode="toc">
    <li>
      <a href="#_intro">Introduction</a>
      <ol>
        <li>
          <a href="#_intro_purpose">Purpose</a>
        </li>
        <li>
          <a href="#_intro_scope">Scope</a>
        </li>
        <li>
          <a href="#_intro_overview">System Overview</a>
        </li>
        <li>
          <a href="#_intro_references">References</a>
        </li>
      </ol>
    </li>
  </xsl:template>

  <!-- Render the definitions for the table of contents. -->
  <xsl:template match="spec:definitions" mode="toc">
    <li>
      <a href="#_definitions">Definitions</a>
    </li>
  </xsl:template>

  <!-- Render all of the use cases for the table of contents. -->
  <xsl:template match="spec:use-cases" mode="toc">
    <li>
      <a href="#_use_cases">Use Cases</a>
      <ol>
        <xsl:apply-templates mode="toc"/>
      </ol>
    </li>
  </xsl:template>

  <!-- Render a use case group as a nested list. -->
  <xsl:template match="spec:use-cases/spec:group" mode="toc">
    <li class="group">
      <span>
        <xsl:value-of select="spec:title"/>
      </span>
      <ol>
        <xsl:apply-templates mode="toc" select="spec:use-case"/>
      </ol>
    </li>
  </xsl:template>

  <!-- Render a single use case as a item in the table of contents. -->
  <xsl:template match="spec:use-cases/spec:use-case | spec:use-cases/spec:group/spec:use-case" mode="toc">
    <li class="id {spec:number}" data-number="{spec:number}">
      <a href="#{spec:number}">
        <xsl:value-of select="spec:name"/>
      </a>
    </li>
  </xsl:template>

  <!-- Render all of the functional requirements for the table of contents. -->
  <xsl:template match="spec:functional-requirements" mode="toc">
    <li>
      <a href="#_func_reqs">Functional Requirements</a>
      <ol>
        <xsl:apply-templates mode="toc"/>
      </ol>
    </li>
  </xsl:template>

  <!-- Render all of the nonfunctional requirements for the table of contents. -->
  <xsl:template match="spec:nonfunctional-requirements" mode="toc">
    <li>
      <a href="#_nonfunc_reqs">Nonfunctional Requirements</a>
      <ol>
        <xsl:apply-templates mode="toc"/>
      </ol>
    </li>
  </xsl:template>

  <!-- Render a requirements group as a nested list. -->
  <xsl:template match="spec:functional-requirements/spec:group | spec:nonfunctional-requirements/spec:group" mode="toc">
    <li class="group">
      <span>
        <xsl:value-of select="spec:title"/>
      </span>
      <ol>
        <xsl:apply-templates mode="toc" select="spec:requirement"/>
      </ol>
    </li>
  </xsl:template>

  <!-- Render a requirement as a item in the table of contents. -->
  <xsl:template match="spec:requirement" mode="toc">
    <li class="id {spec:number}" data-number="{spec:number}">
      <a href="#{spec:number}">
        <xsl:value-of select="spec:name"/>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>
