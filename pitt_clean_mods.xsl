<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:copyrightMD="http://www.cdlib.org/inside/diglib/copyrightMD" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mods="http://www.loc.gov/mods/v3">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" media-type="text/xml"/>
    <xsl:strip-space elements="*"/>
    

    
    <xsl:template
        match="*[not(node())] | *[not(node()[2]) and node()/self::text() and not(normalize-space())]"/>    

    <xsl:template match="node()|@*">
        <xsl:copy>
            
            <xsl:apply-templates select="node()[normalize-space()]|@*[normalize-space()]"/>
            <xsl:apply-templates select="mods:accessCondition/copyrightMD:copyright"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="mods:accessCondition/copyrightMD:copyright">
        <mods:accessCondition>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        </mods:accessCondition>
    </xsl:template>
    

</xsl:stylesheet>