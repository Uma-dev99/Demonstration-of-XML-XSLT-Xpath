<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template to match the root element -->
    <xsl:template match="/collection">
        <html>
            <body>
                <h2>Movie Collection - Shelf: <xsl:value-of select="@shelf"/></h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Title</th>
                        <th>Type</th>
                        <th>Format</th>
                        <th>Year</th>
                        <th>Rating</th>
                        <th>Stars</th>
                        <th>Description</th>
                    </tr>
                    
                    <!-- Iterate through each movie -->
                    <xsl:for-each select="movie">
                        <tr>
                            <td><xsl:value-of select="@title"/></td>
                            <td><xsl:value-of select="type"/></td>
                            <td><xsl:value-of select="format"/></td>
                            <td>
                                <!-- Only show year if it exists -->
                                <xsl:choose>
                                    <xsl:when test="year">
                                        <xsl:value-of select="year"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        N/A
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="rating"/></td>
                            <td><xsl:value-of select="stars"/></td>
                            <td><xsl:value-of select="description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
