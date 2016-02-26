<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:spec="urn:kherge:specification"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

  <!-- Render all of the functional requirements. -->
  <xsl:template match="spec:functional-requirements">
    <h2 id="_func_reqs">Functional Requirements</h2>
    <xsl:apply-templates/>
    <div class="page-break"/>
  </xsl:template>

  <!-- Render all of the nonfunctional requirements. -->
  <xsl:template match="spec:nonfunctional-requirements">
    <h2 id="_nonfunc_reqs">Nonfunctional Requirements</h2>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Render each group as is. -->
  <xsl:template match="spec:functional-requirements/spec:group | spec:nonfunctional-requirements/spec:group">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Render each group title as a heading. -->
  <xsl:template match="spec:functional-requirements/spec:group/spec:title | spec:nonfunctional-requirements/spec:group/spec:title">
    <h3>
      <xsl:value-of select="."/>
    </h3>
  </xsl:template>

  <!-- Render a requirement as a table. -->
  <xsl:template match="spec:requirement">
    <div class="panel panel-default requirement" id="{./spec:number}">
      <div class="panel-heading">
        <h4 class="panel-title">
          <span class="number">
            <xsl:value-of select="./spec:number"/>
          </span>
          <xsl:value-of select="./spec:name"/>
        </h4>
      </div>
      <table class="table table-bordered">
        <tbody>
          <xsl:apply-templates/>
          <tr>
            <th>Referenced By</th>
            <td>
              <xsl:variable name="reqNumber" select="normalize-space(spec:number/text())"/>
              <xsl:variable name="reqRefs" select="//spec:requirement[spec:references/spec:reference[text() = $reqNumber]]"/>
              <xsl:choose>
                <xsl:when test="$reqRefs">
                  <ul>
                    <xsl:apply-templates mode="reqRefs" select="$reqRefs"/>
                  </ul>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>There are no references.</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </xsl:template>

  <!-- Ignore the name and number. -->
  <xsl:template match="spec:requirement/spec:number"/>
  <xsl:template match="spec:requirement/spec:name"/>

  <!-- Render the summary as a table row. -->
  <xsl:template match="spec:requirement/spec:summary">
    <tr>
      <th>Summary</th>
      <td>
        <xsl:apply-templates mode="copy"/>
      </td>
    </tr>
  </xsl:template>

  <!-- Render the rationale as a table row. -->
  <xsl:template match="spec:requirement/spec:rationale">
    <tr>
      <th>Rationale</th>
      <td>
        <xsl:apply-templates mode="copy"/>
      </td>
    </tr>
  </xsl:template>

  <!-- Render the requirements as a table row. -->
  <xsl:template match="spec:requirement/spec:requirements">
    <tr>
      <th>Requirements</th>
      <td>
        <xsl:apply-templates mode="copy"/>
      </td>
    </tr>
  </xsl:template>

  <!-- Render the references as a list in a table row. -->
  <xsl:template match="spec:requirement/spec:references">
    <tr>
      <th>References</th>
      <td>
        <ul>
          <xsl:apply-templates/>
        </ul>
      </td>
    </tr>
  </xsl:template>

  <!-- Render a reference as a list item. -->
  <xsl:template match="spec:requirement/spec:references/spec:reference">
    <xsl:variable name="refId" select="."/>
    <xsl:apply-templates
      mode="reqRefs"
      select="//spec:use-case[spec:number/text() = $refId] | //spec:requirement[spec:number/text() = $refId]"
    />
  </xsl:template>

  <!-- Render the requirements that reference the requirement. -->
  <xsl:template match="spec:use-case | spec:requirement" mode="reqRefs">
    <li>
      <a href="#{spec:number}">
        <strong>
          <xsl:value-of select="spec:number"/>
        </strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="spec:name"/>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>
