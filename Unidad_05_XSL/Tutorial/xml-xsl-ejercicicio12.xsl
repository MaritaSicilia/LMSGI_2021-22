<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/marvel">
    <html>
      <head>
        <title>Superheroes</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <h1>Superhéroes de Marvel</h1>
        <xsl:for-each select="superheroe">
            <xsl:choose>
              <xsl:when test="@nombre = 'Thor'">
                <xsl:call-template name="muestraTablaSuperheroe">
                  <xsl:with-param name="color" select="'#FF0000'"/>
                  <xsl:with-param name="imagen" select="'../image/Thor.jpg'"></xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="@nombre = 'Hulk'">
                <xsl:call-template name="muestraTablaSuperheroe">
                  <xsl:with-param name="color" select="'#00FF00'"/>
                  <xsl:with-param name="imagen" select="'../image/hulk.jpg'"></xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="@nombre = 'Iron Man'">
                <xsl:call-template name="muestraTablaSuperheroe">
                  <xsl:with-param name="color" select="'#0000FF'"/>
                  <xsl:with-param name="imagen" select="'../image/iron-man.jpg'"></xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="muestraTablaSuperheroe">
                  <xsl:with-param name="color" select="'#CCCCCC'"/>
                  <xsl:with-param name="imagen" select="'../image/marvel.jpg'"></xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          <br/>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>


  
  <xsl:template name="muestraTablaSuperheroe">
    <xsl:param name="color"/>
    <xsl:param name="imagen"/>

 
    <div>
      <xsl:attribute name="style">width:400px; background:
        <xsl:choose>
          <xsl:when test="contains(@nombre, 'a')">
            <xsl:value-of select="$color"/>;
          </xsl:when>
          <xsl:otherwise>
            #FFFFFF;
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <h2>
        <xsl:value-of select="@nombre"/> - Color <xsl:value-of select="$color"/>
      </h2>
    </div>
    
<!--    <div style="width: 400px; background:{$color}; position: left;">
      <table>
        <tr class="tituloTabla">
          <td colspan="2"><xsl:value-of select="@nombre"/></td>
        </tr>
        <tr>
          <td rowspan="2">
            <img>
              <xsl:attribute name="src"><xsl:value-of select="$imagen"/></xsl:attribute>
            </img>
          </td>
          <td><xsl:value-of select="concat('Poderes: ', @poderes)"/></td>
        </tr>
        <tr>
          <td><xsl:value-of select="concat('Amigos: ', @amigos)"/></td>
        </tr>
      </table>
    </div> -->
  </xsl:template>


  <xsl:template name="css">
    <style type="text/css">
      body {
      margin: 50px;
      padding: 0px;
      background: #2372DE;
      font-family: 'Open Sans', sans-serif;
      font-size: 11pt;
      color: #FFFFFF;
      text-align:center;
      }    
      
      img {
      width: 200px;	
      }
      
      .tituloTabla {
      text-align:center;
      padding:15px;
      background-color:#330099;
      font-weight:bold;
      }
      
    </style>
  </xsl:template>

</xsl:stylesheet>
