<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/gormitis">
    <html>
      <head>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <table width="100%">
          <tr>
            <th></th>
            <th>Gormiti</th>
            <th>Tribu</th>
          </tr>
          <xsl:for-each select="gormiti">
            <tr>
              <xsl:attribute name="style">background:
                <xsl:if test="position() mod 2 = 1">
                  #9cdeff;  
                </xsl:if>
                #d4f1ff;
              </xsl:attribute>
              <td><xsl:value-of select="position()"/></td>
              <td><img src="{.}"/></td>
              <td><xsl:value-of select="@tribu"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>



  <xsl:template name="css">
    <style>
      img {
        width:50px;
      }
    </style>
  </xsl:template>
</xsl:stylesheet>
