<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/datos">
        <html>
            <head>
                <title>Ejemplo transformación XQUERY y Transformación a HTML</title>
            </head>
            <body>
                <xsl:for-each select="alumno">
                    <xsl:value-of select="."/><br/>
                </xsl:for-each>
            </body>
        </html>        
    </xsl:template>
</xsl:stylesheet>