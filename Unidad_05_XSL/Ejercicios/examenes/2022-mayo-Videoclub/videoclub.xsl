<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
   
    <xsl:template match="/videoclub">
        <body>
            <xsl:call-template name="Tabla"></xsl:call-template>
            <table border="1">
                <xsl:call-template name="bucleForFila">
                    <xsl:with-param name="i">1</xsl:with-param>
                </xsl:call-template>
            </table>
            <p>El juego más caro es
                <xsl:for-each select="/videoclub/videojuegos/videoJuego">
                    <xsl:sort select="@pegi" order="descending"/>
                    <xsl:if test="position() = 1">
                        <xsl:value-of select="."/><br/>
                    </xsl:if>
                </xsl:for-each>
            </p>
            <p>La peli más corta es
                <xsl:for-each select="/videoclub/Peliculas/pelicula">
                    <xsl:sort select="@duracionEnMinutos"/>
                    <xsl:if test="position() = 1">
                        <xsl:value-of select="@titulo"/><br/>
                    </xsl:if>
                </xsl:for-each>
            </p>
        </body>
        
    </xsl:template>
    
    <xsl:template name="Tabla">
        <table border="1">
            <thead style="background: blue; color: white;">
                <td>Título</td>
                <td>Pegi</td>
                <td>Duración/Plataforma</td>
                <td>Alquiler diario</td>
            </thead>
            <tbody>
                <xsl:apply-templates select="Peliculas"></xsl:apply-templates>
                <xsl:apply-templates select="videojuegos"></xsl:apply-templates>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="Peliculas">
        <xsl:for-each select="pelicula">   
            <xsl:sort select="@order"/>
            <tr>
                <xsl:if test="position() mod 2 = 1">
                    <xsl:attribute name="style">background: yellow;</xsl:attribute>
                </xsl:if>
                <xsl:if test="position() mod 2 = 0">
                    <xsl:attribute name="style">background: lightyellow;</xsl:attribute>
                </xsl:if>
                <td><xsl:value-of select="@titulo"/></td>
                <td><xsl:value-of select="@pegi"/></td>
                <td><xsl:value-of select="@duracionEnMinutos"/></td>
                <td><xsl:value-of select="@alquilerDiario"/></td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="videojuegos">
        <xsl:for-each select="videoJuego">   
            <xsl:sort select="@order"/>
            <tr>
                <xsl:if test="position() mod 2 = 1">
                    <xsl:attribute name="style">background: green;</xsl:attribute>
                </xsl:if>
                <xsl:if test="position() mod 2 = 0">
                    <xsl:attribute name="style">background: lightgreen;</xsl:attribute>
                </xsl:if>
                <td><xsl:value-of select="."/></td>
                <td><xsl:value-of select="@pegi"/></td>
                <td><xsl:value-of select="@plataforma"/></td>
                <td><xsl:value-of select="@alquilerDiario"/></td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    
    
    
    
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if  test="$i &lt;=5">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i">
                        <xsl:value-of select="$i"/>
                    </xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template> 
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i + 1"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        
    </xsl:template>
    
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <xsl:if test="$j &lt;=5"   >
            <xsl:call-template name="celda">
                <xsl:with-param name="x">
                    <xsl:value-of select="$j"/>
                </xsl:with-param>
                <xsl:with-param name="y">
                    <xsl:value-of select="$i"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i"/>
                </xsl:with-param>
                <xsl:with-param name="j">
                    <xsl:value-of select="$j + 1"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        
    </xsl:template> 
    
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td width="100px">
            <xsl:for-each select="Peliculas/pelicula">
                <xsl:if test="coordenadas/@x = $y and coordenadas/@y = $x">
                    <xsl:attribute name="style">
                        background: #<xsl:value-of select="../../bancoDeImagenes/color[@identificador='peliculas']/."/>
                    </xsl:attribute>
                    <xsl:variable name="imagenPeli" select="@idimg"/>
                    <img width="100px">
                        <xsl:attribute name="src">
                            <xsl:value-of select="../../bancoDeImagenes/imagen[@identificador=$imagenPeli]/."/>
                        </xsl:attribute>
                    </img>
                    <xsl:value-of select="@titulo"/>
                    <br/>
                    Pegi: <xsl:value-of select="@pegi"/>
                    <br/>  
                    Alquiler: <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="videojuegos/videoJuego">
                <xsl:if test="@x = $y and @y = $x">
                    <xsl:attribute name="style">
                        background: #<xsl:value-of select="../../bancoDeImagenes/color[@identificador='videojuegos']/."/>
                    </xsl:attribute>
                    <xsl:variable name="imagenVideojuego" select="idImg/@valor"/>
                    <img width="100px">
                        <xsl:attribute name="src">
                            <xsl:value-of select="../../bancoDeImagenes/imagen[@identificador=$imagenVideojuego]/."/>
                        </xsl:attribute>
                    </img>
                    <xsl:value-of select="."/>
                    <br/>
                    Pegi: <xsl:value-of select="@pegi"/>
                    <br/>
                    Alquiler: <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
</xsl:stylesheet>