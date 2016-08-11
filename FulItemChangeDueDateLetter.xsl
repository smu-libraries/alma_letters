<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20160811 by Wee Hiong
    1. Remove library address from the body.
    2. Remove bolding from the message text.
    3. Remove additional header ("Loans") from the list of loans.
    4. Replace the description column with the call number.
    5. Change signature to patron-facing footer.
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
                <br />
                <!-- mailReason.xsl -->
                <xsl:call-template name="toWhomIsConcerned" />
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                            <tr>
                                <td>
                                    <xsl:if test="notification_data/message='RECALL_DUEDATE_CHANGE'">
                                        @@recall_and_date_change@@
                                    </xsl:if>
                                    <xsl:if test="notification_data/message='RECALL_ONLY'">
                                        @@recall_and_no_date_change@@
                                    </xsl:if>
                                    <xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
                                        @@message@@
                                    </xsl:if>
                                    <xsl:if test="notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE'">
                                        @@cancel_recall_date_change@@
                                    </xsl:if>
                                    <xsl:if test="notification_data/message='RECALL_CANCEL_ITEM_RENEWED'">
                                        @@cancel_recall_renew@@
                                    </xsl:if>
                                    <xsl:if test="notification_data/message='RECALL_CANCEL_NO_CHANGE'">
                                        @@cancel_recall_no_date_change@@
                                    </xsl:if>
                                    <br />
                                    <br />
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
                                            <th>@@old_due_date@@</th>
                                            <th>@@new_due_date@@</th>
                                            <th>@@library@@</th>
                                        </tr>
                                        <xsl:for-each select="notification_data/item_loans/item_loan">
                                            <tr>
                                                <td>
                                                    <xsl:value-of select="title"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="call_number"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="author"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="old_due_date_str"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="new_due_date_str"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="library_name"/>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </table>
                                </td>
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
