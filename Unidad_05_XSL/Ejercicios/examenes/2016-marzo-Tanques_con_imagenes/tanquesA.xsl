<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/juegoTanques">
    <html>
      <head>
        <style>
          img { width: 40px; }
        </style>
      </head>
      <body>
        <table border="1" width="100%">
          <tr style="background: blue; color: white;">
            <th>Jugada</th>
            <th></th>
            <th>Tanque</th>
            <th>Descripción</th>
          </tr>
          <xsl:apply-templates select="jugadasDescritas/jugada"/>
        </table>
      </body>
    </html>
  </xsl:template>
 
 
  <xsl:template match="jugada">
    <tr>
      <xsl:if test="position() mod 2 = 1">
        <xsl:attribute name="style">background:lightblue;</xsl:attribute>
      </xsl:if>
      <td><xsl:value-of select="position()"/></td>
      <td><xsl:value-of select="@jugador"/></td>
      <td>
        <xsl:call-template name="imagenDeTanque">
          <xsl:with-param name="jugador" select="@jugador"/>
        </xsl:call-template>
      </td>
      <td><xsl:value-of select="@desc"/></td>
    </tr>
  </xsl:template>
 
 
  <xsl:template name="imagenDeTanque">
    <xsl:param name="jugador"/>
    <xsl:for-each select="/juegoTanques/tanques/imagenTanque">
      <xsl:if test="@jugador = $jugador">
        <img src="{.}"/>
      </xsl:if>
    </xsl:for-each>    
  </xsl:template>

</xsl:stylesheet>
