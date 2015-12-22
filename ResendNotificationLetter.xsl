<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20151222 by Wee Hiong
    1. Add link to library account.

    Modified on 20150910 by Wee Hiong
    1. Remove signature and footer.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="header.xsl" />
    <xsl:include href="senderReceiver.xsl" />
    <xsl:include href="mailReason.xsl" />
    <xsl:include href="footer.xsl" />
    <xsl:include href="style.xsl" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="generalStyle" />
            </head>
            <body>
                <xsl:attribute name="style">
                    <!-- style.xsl -->
                    <xsl:call-template name="bodyStyleCss" />
                </xsl:attribute>
                <!-- header.xsl -->
                <xsl:call-template name="head" />
                <table cellspacing="0" cellpadding="5" border="0">
                    <tr>
                        <td>
                            <h3>@@dear@@</h3>
                        </td>
                    </tr>
                </table>
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                            <tr>
                                <td>
                                    <h>@@find_attached@@</h>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
                <br />
                <table>
                    <xsl:if test="notification_data/file_name !=''">
                        <tr>
                            <td>
                                <b>@@file_name@@:</b>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="notification_data/file_name" />
                            </td>
                        </tr>
                    </xsl:if>
                </table>
                <br />
                <!-- footer.xsl -->
                <xsl:call-template name="myAccount" />
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
