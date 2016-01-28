<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:spec="urn:kherge:specification"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

  <!-- Render all of the definitions in a table. -->
  <xsl:template match="spec:definitions">
    <h2 id="_definitions">Definitions</h2>
    <div class="panel panel-default">
      <table class="table table-striped definitions">
        <thead>
          <tr>
            <th>Term</th>
            <th>Definition</th>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates/>
        </tbody>
      </table>
    </div>
    <div class="page-break"/>
  </xsl:template>

  <!-- Render a definition as a table row. -->
  <xsl:template match="spec:definitions/spec:definition">
    <tr>
      <th>
        <xsl:value-of select="./spec:term"/>
      </th>
      <td>
        <xsl:apply-templates select="./spec:definition" mode="copy"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
