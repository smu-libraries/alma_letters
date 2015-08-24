<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20150808 by Wee Hiong
    1. Replaced patron name with a generic Sir/Mdm.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="toWhomIsConcerned">
        <table cellspacing="0" cellpadding="5" border="0">
            <tr>
                <td>
                    <xsl:for-each select="notification_data">
                        <h3>@@dear@@</h3>
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>
