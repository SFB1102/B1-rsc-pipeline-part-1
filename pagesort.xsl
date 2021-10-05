<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:str="http://exslt.org/strings"
extension-element-prefixes="str">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:param name="order">2,3,1</xsl:param>

<xsl:template match="/">
    <text>
        <xsl:copy-of select="text/@*"/>
        <xsl:for-each select="text/page">
            <xsl:sort select="str:tokenize($order, ',')[count(current()/preceding-sibling::page) + 1]" data-type="number" order="ascending"/>
            <xsl:copy-of select="."/>
        </xsl:for-each>
    </text>
</xsl:template>

</xsl:stylesheet>
