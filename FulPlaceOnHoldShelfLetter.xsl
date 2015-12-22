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
                <!-- mailReason.xsl -->
                <xsl:call-template name="toWhomIsConcerned" />
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                            <tr>
                                <td>@@following_item_requested_on@@
                                    <xsl:value-of select="notification_data/request/create_date" />,
                                    @@can_picked_at@@
                                </td>
                            </tr>
                            <xsl:if test="notification_data/request/work_flow_entity/expiration_date">
                                <tr>
                                    <td>@@note_item_held_until@@
                                       <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date" />.
                                    </td>
                                </tr>
                            </xsl:if>
                            <tr>
                                <td>
                                    <!-- recordTitle.xsl -->
                                    <xsl:call-template name="recordTitle" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br />
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
