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
        
        <br/>
        <table style="background: url('{/gormitis/tablero/@url}') no-repeat;" width="100%" border="1">
          <tr>
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="0"/>
              <xsl:with-param name="y" select="0"/>
            </xsl:call-template>      
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="1"/>
              <xsl:with-param name="y" select="0"/>
            </xsl:call-template>      
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="2"/>
              <xsl:with-param name="y" select="0"/>
            </xsl:call-template>      
          </tr>
          <tr>
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="0"/>
              <xsl:with-param name="y" select="1"/>
            </xsl:call-template>      
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="1"/>
              <xsl:with-param name="y" select="1"/>
            </xsl:call-template>      
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="2"/>
              <xsl:with-param name="y" select="1"/>
            </xsl:call-template>      
          </tr>
          <tr>
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="0"/>
              <xsl:with-param name="y" select="2"/>
            </xsl:call-template>      
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="1"/>
              <xsl:with-param name="y" select="2"/>
            </xsl:call-template>      
            <xsl:call-template name="casilla">
              <xsl:with-param name="x" select="2"/>
              <xsl:with-param name="y" select="2"/>
            </xsl:call-template>      
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>


  
  <xsl:template name="casilla">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    
    <td>
      <xsl:for-each select="/gormitis/tablero/gormitiEnMapa">
        <xsl:if test="$x = @x and $y = @y">
          <xsl:call-template name="buscaImagenGormiti">
            <xsl:with-param name="tribu" select="@tribu"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>


  <xsl:template name="buscaImagenGormiti">
    <xsl:param name="tribu"/>
    <xsl:for-each select="/gormitis/gormiti">
      <xsl:if test="@tribu = $tribu">
        <img src="{.}"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="css">
    <style>
      img {
        width:50px;
      }
      th {
        color: white;
        background: blue;
      }
    </style>
  </xsl:template>
</xsl:stylesheet>
