<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/factura">
        <html>
            <head></head>
            <body>
                Factura número: <xsl:value-of select="@n_fac"/>
                <br/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="datos_empresa">
        Empresa: <xsl:value-of select="concat(nombre, ' - ', cif)"/>
        <br/>
        Dirección: <xsl:value-of select="concat(dir, ' - ', poblacion/@cod_postal, ' ', poblacion, ' (', provincia, ')')"/>
        <br/>
        Teléfono: <xsl:value-of select="telefono"/>
        <p/>
    </xsl:template>
    
    <xsl:template match="datos_cliente">        
        Cliente: <xsl:value-of select="concat(nombre, '. Num: ', @n_cli)"/>
        <br/>
        Dirección: <xsl:value-of select="concat(dir_env, ' - ', poblacion/@cod_postal, ' ', poblacion, ' (', provincia, ')')"/>
        <p/>
    </xsl:template>

    <xsl:template match="datos_factura">
        Factura. Número pedido: <xsl:value-of select="concat(@n_ped, '. Fecha: ', fecha, '. Método de pago: ', @f_pago)"/>
        <br/>
        Moneda: <xsl:value-of select="concat(@moneda, '. Cuota aplicable de IVA: ', @iva, '%')"/>
        <p/>
        Conceptos facturables:<br/>
        <xsl:for-each select="linea">
            <xsl:value-of select="concat(ref, ' - ', desc, ' - Unidad(es): ', cant, ', - Precio unitario: ', precio, ' - Total (con iva): ', importe) "/><br/>
        </xsl:for-each>     
        <p/>
        Total por conceptos: <xsl:value-of select="concat(base, ' ' , @moneda)"/><br/>
        IVA: <xsl:value-of select="concat(cuota_iva, ' ' , @moneda)"/><br/>
        Importe total: <xsl:value-of select="concat(total, ' ' , @moneda)"/><br/>
    </xsl:template>
</xsl:stylesheet>