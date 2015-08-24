<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="header.xsl" />
    <xsl:include href="senderReceiver.xsl" />
    <xsl:include href="mailReason.xsl" />
    <xsl:include href="footer.xsl" />
    <xsl:include href="style.xsl" />
    <xsl:include href="recordTitle.xsl" />
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
                <!-- SenderReceiver.xsl -->
                <xsl:call-template name="senderReceiver" />
                <br />
                <!-- mailReason.xsl -->
                <xsl:call-template name="toWhomIsConcerned" />
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                            <tr>
                                <td>
                                    <h>@@inform_loaned_items@@</h>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>@@loans@@</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="5" class="listing">
                                        <xsl:attribute name="style">
                                            <!-- style.xsl -->
                                            <xsl:call-template name="mainTableStyleCss" />
                                        </xsl:attribute>
                                        <tr>
                                            <th>@@title@@</th>
                                            <th>Call Number</th>
                                            <th>@@author@@</th>
                                            <th>@@loan_date@@</th>
                                            <th>@@due_date@@</th>
                                            <th>@@library@@</th>
                                        </tr>
                                        <xsl:for-each select="notification_data/items/item_loan">
                                            <tr>
                                                <td>
                                                    <xsl:value-of select="title" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="call_number"></xsl:value-of>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="author" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="loan_date" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="new_due_date_str" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="library_name" />
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </table>
                                </td>
                            </tr>
                            <br />
                            <br />
                        </table>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
