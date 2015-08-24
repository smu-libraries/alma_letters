<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified 20150812 by Wee Hiong
    1. Hide the recipient's name and address (removed the entire left-hand side).
    2. Hide address line 2 (blank) and redundant country in the sender's address.
    3. Combine city and postal code into one line in the sender's address.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="senderReceiver">
        <table cellspacing="0" cellpadding="5" border="0" width="100%">
            <tr>
                <td width="50%"></td>
                <td width="50%" align="right">
                    <xsl:for-each select="notification_data/organization_unit">
                        <table>
                            <!-- style.xsl -->
                            <xsl:attribute name="style">
                                <xsl:call-template name="listStyleCss" />
                            </xsl:attribute>
                            <tr>
                                <td>
                                    <xsl:value-of select="name" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="address/line1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <xsl:value-of select="address/city" />&#160;
                                <xsl:value-of select="address/postal_code" /></td>
                            </tr>
                            <tr />
                            <tr>
                                <td>Tel:
                                <xsl:value-of select="phone/phone" /></td>
                            </tr>
                            <tr>
                                <td>Email:
                                <a>
                                    <xsl:attribute name="href">mailto:
                                    <xsl:value-of select="email/email" /></xsl:attribute>
                                    <xsl:value-of select="email/email" />
                                </a></td>
                            </tr>
                        </table>
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>
