<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20160707 by Wee Hiong
    1. Add do-not-reply message to the footer.

    Modified on 20151222 by Wee Hiong
    1. Remove sender's address as contact information is now inside the header.
    2. Add link to library account.
    3. Remove unnecessary bolds.

    Modified on 20151116 by Wee Hiong
    1. Remove footer.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="header.xsl" />
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
                <br />
                <!-- mailReason.xsl -->
                <xsl:call-template name="toWhomIsConcerned" />
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                            <xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">
                                <tr>
                                    <td>
                                        <h>@@reminder_message@@</h>
                                    </td>
                                </tr>
                                <xsl:if test="notification_data/overdue_item_loans/item_loan">
                                    <tr>
                                        <td>
                                            <b>@@overdue_loans@@</b>
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
                                                    <th>@@description@@</th>
                                                    <th>@@author@@</th>
                                                    <th>@@due_date@@</th>
                                                    <th>@@fine@@</th>
                                                    <th>@@library@@</th>
                                                </tr>
                                                <xsl:for-each select="notification_data/overdue_item_loans/item_loan">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="title" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="description" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="author" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="due_date" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="fine" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="library_name" />
                                                        </td>
                                                    </tr>
                                                </xsl:for-each>
                                            </table>
                                            <br />
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="notification_data/item_loans/item_loan">
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
                                                    <th>@@due_date@@</th>
                                                    <th>@@fine@@</th>
                                                    <th>@@description@@</th>
                                                </tr>
                                                <xsl:for-each select="notification_data/item_loans/item_loan">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="title" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="due_date" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="fine" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="description" />
                                                        </td>
                                                    </tr>
                                                </xsl:for-each>
                                            </table>
                                            <br />
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="notification_data/organization_fee_list/string">
                                <tr>
                                    <td>
                                        <h>@@debt_message@@</h>
                                    </td>
                                </tr>
                                <xsl:for-each select="notification_data/organization_fee_list/string">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="." />
                                        </td>
                                    </tr>
                                </xsl:for-each>
                                <tr>
                                    <td>
                                        <b>@@total@@
                                            <xsl:value-of select="notification_data/total_fee" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h>@@please_pay_message@@</h>
                                    </td>
                                </tr>
                            </xsl:if>
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
