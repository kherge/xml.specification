<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:spec="urn:kherge:specification"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

  <!-- Import other stylesheets. -->
  <xsl:import href="toc.xsl"/>
  <xsl:import href="utilities.xsl"/>
  <xsl:import href="spec/introduction.xsl"/>
  <xsl:import href="spec/definitions.xsl"/>
  <xsl:import href="spec/use-cases.xsl"/>
  <xsl:import href="spec/requirements.xsl"/>

  <!-- Output as HTML. -->
  <xsl:output
    doctype-public="-//W3C//DTD XHTML 1.1//EN"
    doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
    encoding="utf-8"
    indent="yes"
    media-type="text/html"
    method="html"
  />

  <!-- Render the page. -->
  <xsl:template match="/spec:specification">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>
          <xsl:value-of select="./spec:project/spec:name"/>
        </title>
        <link href="assets/css/bootstrap.css" media="all" rel="stylesheet"/>
        <link href="assets/css/specification.css" media="all" rel="stylesheet"/>
      </head>
      <body>
        <div class="menu">
          <ul class="nav nav-pills">
            <li>
              <a href="#top">
                <span class="glyphicon glyphicon-arrow-up"></span>
                Top
              </a>
            </li>
            <li>
              <a href="javascript:toggleDarkMode()">
                <span class="enabled">
                  <span class="glyphicon glyphicon-flash"></span>
                  Light Mode
                </span>
                <span class="disabled">
                  <span class="glyphicon glyphicon-sunglasses"></span>
                  Dark Mode
                </span>
              </a>
            </li>
          </ul>
        </div>
        <div class="container-fluid">
          <div class="row visible-print">
            <div class="col-xs-12">
              <div class="jumbotron">
                <h1>
                  <xsl:value-of select="./spec:project/spec:name"/>
                </h1>
                <p class="text-muted">Software Requirements Specification</p>
              </div>
            </div>
          </div>
          <div class="page-break"/>
          <div class="row hidden-print">
            <div class="col-xs-12">
              <div class="page-header">
                <h1>
                  <xsl:value-of select="./spec:project/spec:name"/>
                </h1>
                <p class="text-muted">Software Requirements Specification</p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12 col-md-4 toc">
              <h2>Table of Contents</h2>
              <ol>
                <xsl:apply-templates mode="toc"/>
              </ol>
              <div class="page-break"/>
            </div>
            <div class="col-xs-12 col-md-8 spec">
              <xsl:apply-templates/>
            </div>
          </div>
        </div>
        <script src="assets/js/jquery.js"/>
        <script src="assets/js/jquery/cookie.js"/>
        <script src="assets/js/bootstrap.js"/>
        <script src="assets/js/specification.js"/>
      </body>
    </html>
  </xsl:template>

  <!-- Ignore the project information. -->
  <xsl:template match="spec:project"/>

</xsl:stylesheet>
