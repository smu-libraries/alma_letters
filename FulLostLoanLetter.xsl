<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20151222 by Wee Hiong.
    1. Remove sender's address as contact information is now inside the header.
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
                <br />
                <table cellspacing="0" cellpadding="5" border="0">
                    <tr>
                        <td>
                            <h>@@inform_you_item_below@@</h>
                            <h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
                        </td>
                    </tr>
                </table>
                <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                        <!-- style.xsl -->
                        <xsl:call-template name="mainTableStyleCss" />
                    </xsl:attribute>
                    <xsl:for-each select="notification_data">
                        <table>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <b>@@lost_item@@:</b>
                                            </td>
                                            <td>
                                                <xsl:value-of select="item_loan/title" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>@@by@@:</b>
                                            </td>
                                            <td>
                                                <xsl:value-of select="item_loan/author" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>@@library@@:</b>
                                            </td>
                                            <td>
                                                <xsl:value-of select="organization_unit/name" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>@@loan_date@@:</b>
                                            </td>
                                            <td>
                                                <xsl:value-of select="item_loan/loan_date" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>@@due_date@@:</b>
                                            </td>
                                            <td>
                                                <xsl:value-of select="item_loan/due_date" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>@@barcode@@:</b>
                                            </td>
                                            <td>
                                                <xsl:value-of select="item_loan/barcode" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>@@call_number@@:</b>
                                            </td>
                                            <td>
                                                <xsl:value-of select="phys_item_display/call_number" />
                                            </td>
                                        </tr>
                                    </table>
                                    <b>@@charged_with_fines_fees@@</b>
                                </td>
                            </tr>
                        </table>
                    </xsl:for-each>
                    <table cellpadding="5" class="listing">
                        <xsl:attribute name="style">
                            <!-- style.xsl -->
                            <xsl:call-template name="mainTableStyleCss" />
                        </xsl:attribute>
                        <tr>
                            <th>@@fee_type@@</th>
                            <th>@@fee_amount@@</th>
                            <th>@@note@@</th>
                        </tr>
                        <xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
                            <tr>
                                <td>
                                    <xsl:value-of select="fine_fee_type_display" />
                                </td>
                                <td>
                                    <xsl:value-of select="fine_fee_ammount/sum" />
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="fine_fee_ammount/currency" />
                                </td>
                                <td>
                                    <xsl:value-of select="ff" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <br />
                    <br />@@additional_info_1@@
                    <br />@@additional_info_2@@
                    <br />
                </table>
                <br />
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
