<?xml version="1.0" encoding="UTF-8"?>

<!--
Diego Pino ... DwC class Any to OAI_DC March 2014.
This XSL StyleSheet only processes the first ocurrence of every class
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dwr="http://rs.tdwg.org/dwc/dwcrecord/" xmlns:dwc="http://rs.tdwg.org/dwc/terms/"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
   
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <oai_dc:dc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
            xsi:noNamespaceSchemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            
           <!--   Not needed anymore, was previous islandora fix, because ID was not added if not previously defined<identifier xmlns="http://purl.org/dc/elements/1.1/">
                <xsl:text>Empty Container por Object ID</xsl:text>
            </identifier> -->
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="/dwr:DarwinRecordSet/dwc:Occurrence[1]/dwc:occurrenceID" mode="occurrenceterms2"/>
            <xsl:apply-templates select="/dwr:DarwinRecordSet/dwc:Occurrence[1]/dwc:*"/>
            <xsl:apply-templates select="/dwr:DarwinRecordSet/dwc:Occurrence[1]/dcterms:*" mode="occurrenceterms"/>
            
        </oai_dc:dc>
    </xsl:template>
    <!--   
Occurrence Class processing

    <xsl:template match="/dwr:DarwinRecordSet/dwc:Occurrence[1]/child::node()">
        <xsl:if test="normalize-space(.)">
            <xsl:choose>
                <xsl:when test="name()='dwc:institutionCode'">
                    <publisher xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </publisher>
                </xsl:when>
                <xsl:when test="name()='dwc:catalogNumber'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                </xsl:when>
                <xsl:when test="name()='dwc:recordNumber'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                </xsl:when>
                <xsl:when test="name()='dwc:otherCatalogNumbers'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="anyID"> </xsl:call-template>
                    <xsl:call-template name="anyRemarks"> </xsl:call-template>
                    <xsl:call-template name="anyBy"> </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
 -->

    <!--   
 Taxon Class processing
 -->
    <xsl:template name="occurrenceID" match="/dwr:DarwinRecordSet/dwc:Occurrence[1]/dwc:occurrenceID" mode="occurrenceterms2">
        <xsl:if test="normalize-space(.)">
            <title xmlns="http://purl.org/dc/elements/1.1/">
                <xsl:apply-templates select="* | node()"/>
            </title>
        </xsl:if>
    </xsl:template>    
    <xsl:template name="taxonterms" match="/dwr:DarwinRecordSet/dwc:Occurrence[1]/dwc:*">
        <xsl:if test="normalize-space(.)">
            <xsl:choose>
                <xsl:when test="name()='dwc:lifeStage'">
                    <subject xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:value-of select="local-name()"/> = <xsl:apply-templates select="* | node()"/>
                    </subject>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>   
                <xsl:when test="name()='dwc:sex'">
                    <subject xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:value-of select="local-name()"/> = <xsl:apply-templates select="* | node()"/>
                    </subject>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>   
                 <xsl:when test="name()='dwc:reproductiveCondition'">
                        <description xmlns="http://purl.org/dc/elements/1.1/">
                            <xsl:value-of select="local-name()"/> = <xsl:apply-templates select="* | node()"/>
                        </description>
                        <xsl:text> </xsl:text>
                        <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:behavior'">
                    <description xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:value-of select="local-name()"/><xsl:text> = </xsl:text>
                        <xsl:apply-templates select="* | node()"/>
                    </description>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:establishmentMeans'">
                    <description xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:value-of select="local-name()"/><xsl:text> = </xsl:text>
                        <xsl:apply-templates select="* | node()"/>
                    </description>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:preparations'">
                    <description xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:value-of select="local-name()"/><xsl:text> = </xsl:text>
                        <xsl:apply-templates select="* | node()"/>
                    </description>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:disposition'">
                    <description xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:value-of select="local-name()"/><xsl:text> = </xsl:text>
                        <xsl:apply-templates select="* | node()"/>
                    </description>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:occurrenceStatus'">
                    <description xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:value-of select="local-name()"/><xsl:text> = </xsl:text>
                        <xsl:apply-templates select="* | node()"/>
                    </description>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:basisOfRecord'">
                    <source xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </source>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:collectionCode'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:institutionCode'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">                     
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:recordNumber'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:catalogNumber'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:when test="name()='dwc:otherCatalogNumbers'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="anyID"> </xsl:call-template>
                    <xsl:call-template name="anyRemarks"> </xsl:call-template>
                    <xsl:call-template name="anyBy"> </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <!--   
 Event Class processing

    <xsl:template match="/dwr:DarwinRecordSet/dwc:Event[1]/child::node()">
        <xsl:if test="normalize-space(.)">
            <xsl:choose>
                <xsl:when test="name()='dwc:institutionCode'">
                    <publisher xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </publisher>
                </xsl:when>
                <xsl:when test="name()='dwc:catalogNumber'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                </xsl:when>
                <xsl:when test="name()='dwc:recordNumber'">
                    <identifier xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </identifier>
                </xsl:when>

                <xsl:otherwise>
                    <xsl:call-template name="anyID"> </xsl:call-template>
                    <xsl:call-template name="anyRemarks"> </xsl:call-template>
                    <xsl:call-template name="anyBy"> </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template> -->
    <!--   
 We need to extract the taxon rank(Taxon Class) to decide which taxon term are we using as title
 -->

    <xsl:template match="/dwr:DarwinRecordSet/dwc:Occurrence[1]/dcterms:*" mode="occurrenceterms" name="dcterms">
        <xsl:if test="normalize-space(.)">
            <xsl:choose>
                <xsl:when test="(contains(name() , 'rights'))  or (contains(name() , 'Rights'))">
                    <xsl:if test="name()='dcterms:rightsHolder'">
                        <publisher xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                        </publisher>
                    </xsl:if>
                    <rights xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </rights>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                
                <xsl:when test="name()='dcterms:bibliographicCitation'"> </xsl:when>
                <xsl:when test="name()='dcterms:references'"> </xsl:when>
                <xsl:when test="name()='dcterms:modified'">
                    <date xmlns="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </date>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="{local-name()}" namespace="http://purl.org/dc/elements/1.1/">
                        <xsl:apply-templates select="* | node()"/>
                    </xsl:element>
                    <xsl:text> </xsl:text>
                    <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template name="anyID">
        <xsl:variable name="isAtEnd">
            <xsl:call-template name="substring-before-last">
                <xsl:with-param name="input" select="name()"/>
                <xsl:with-param name="substr" select="string('ID')"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="normalize-space($isAtEnd)">
            <identifier xmlns="http://purl.org/dc/elements/1.1/">
                <xsl:value-of select="normalize-space(.)"/>
            </identifier>
            <xsl:text> </xsl:text>
            <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
        </xsl:if>
    </xsl:template>
    <xsl:template name="anyRemarks">
        <xsl:variable name="isAtEnd">
            <xsl:call-template name="substring-before-last">
                <xsl:with-param name="input" select="name()"/>
                <xsl:with-param name="substr" select="string('Remarks')"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="normalize-space($isAtEnd)">
            <description xmlns="http://purl.org/dc/elements/1.1/">
                <xsl:value-of select="normalize-space(.)"/>
            </description>
            <xsl:text> </xsl:text>
            <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
        </xsl:if>
    </xsl:template>
    <xsl:template name="anyBy">
        <xsl:variable name="isAtEnd">
            <xsl:call-template name="substring-before-last">
                <xsl:with-param name="input" select="name()"/>
                <xsl:with-param name="substr" select="string('By')"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="normalize-space($isAtEnd)">
            <creator xmlns="http://purl.org/dc/elements/1.1/">
                <xsl:value-of select="normalize-space(.)"/>
            </creator>
            <xsl:text> </xsl:text>
            <xsl:comment> Source node is <xsl:value-of select="name()"/>
                </xsl:comment>
        </xsl:if>
    </xsl:template>

    <xsl:template name="substring-before-last">
        <xsl:param name="input"/>
        <xsl:param name="substr"/>
        <xsl:if test="$substr and contains($input, $substr)">
            <xsl:variable name="temp" select="substring-after($input, $substr)"/>
            <xsl:value-of select="substring-before($input, $substr)"/>
            <xsl:if test="contains($temp, $substr)">
                <xsl:value-of select="$substr"/>
                <xsl:call-template name="substring-before-last">
                    <xsl:with-param name="input" select="$temp"/>
                    <xsl:with-param name="substr" select="$substr"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
