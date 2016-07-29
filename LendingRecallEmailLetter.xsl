<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20160729 by Wee Hiong
    1. Add signature (library's address) with patron-facing footer.
    2. Remove unused includes.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="header.xsl" />
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
                            <h3>@@header@@</h3>
                        </td>
                    </tr>
                </table>
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                            <tr>
                                <td>
                                    <b>@@recall_message@@</b>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="5" class="listing">
                            <xsl:attribute name="style">
                                <!-- style.xsl -->
                                <xsl:call-template name="mainTableStyleCss" />
                            </xsl:attribute>
                            <tr>
                                <th>@@title@@</th>
                                <th>@@author@@</th>
                                <th>@@old_due_date@@</th>
                                <th>@@due_date@@</th>
                            </tr>
                            <tr>
                                <td><xsl:value-of select="notification_data/request/display/title" /></td>
                                <td><xsl:value-of select="notification_data/request/display/author" /></td>
                                <td><xsl:value-of select="notification_data/original_due_date" /></td>
                                <td><xsl:value-of select="notification_data/request/due_date" /></td>
                            </tr>
                        </table>
                        <br />
                        <table>
                            <tr>
                                <b>
                                    <td>@@request_id@@</td>
                                    <td>
                                        <xsl:value-of select="notification_data/request/external_request_id" />
                                    </td>
                                </b>
                            </tr>
                        </table>
                        <br />
                        <!-- footer.xsl -->
                        <xsl:call-template name="myAccount" />
                        <xsl:call-template name="doNotReply" />
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
