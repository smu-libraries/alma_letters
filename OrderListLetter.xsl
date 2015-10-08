<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20151008 by Wee Hiong
    1. Ask vendor to include both PO and PO Line Numbers on the invoice.
    2. Ask vendor to send correspondence to libacq.

    Modified on 20151002 by Wee Hiong
    1. Fix formatting.

    Modified on 20151001 by Wee Hiong
    1. Display PO Number / PO Line Number.

    Modified on 20150826 by Wee Hiong
    1. Remove footer.
    2. Reformat shipping/billing addresses.
    3. Include fund code in each PO line.
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
                <!-- SenderReceiver.xsl -->
                <xsl:call-template name="senderReceiver" />
                <br />
                <!-- mailReason.xsl -->
                <xsl:call-template name="toWhomIsConcerned" />
                <xsl:for-each select="notification_data/letter_texts">
                    <table cellspacing="0" cellpadding="5" border="0">
                        <tr>
                            <td>@@place_order_introduction@@:</td>
                        </tr>
                    </table>
                    <br />
                </xsl:for-each>
                <xsl:for-each select="notification_data">
                    <table width="100%">
                        <tr>
                            <td width="50%">
                            <b>@@order_date@@:</b>&#160;
                            <xsl:value-of select="/notification_data/po/create_date" /></td>
                            <td width="50%">
                            <b>@@vendor_account@@:</b>&#160;
                            <xsl:value-of select="/notification_data/po/vendor_account/description" /></td>
                        </tr>
                        <tr />
                        <tr>
                            <td width="50%">
                            <b>@@shipping_address@@:</b>
                            <br />
                            <xsl:value-of select="/notification_data/po/ship_to_address/line1" />
                            <br />
                            <xsl:value-of select="/notification_data/po/ship_to_address/line2" />
                            <br />
                            <xsl:value-of select="/notification_data/po/ship_to_address/line3" />
                            <br />
                            <xsl:value-of select="/notification_data/po/ship_to_address/city" />&#160;
                            <xsl:value-of select="/notification_data/po/ship_to_address/postal_code" /></td>
                            <td width="50%">
                            <b>@@billing_address@@:</b>
                            <br />
                            <xsl:value-of select="/notification_data/po/bill_to_address/line1" />
                            <br />
                            <xsl:value-of select="/notification_data/po/bill_to_address/line2" />
                            <br />
                            <xsl:value-of select="/notification_data/po/bill_to_address/line3" />
                            <br />
                            <xsl:value-of select="/notification_data/po/bill_to_address/city" />&#160;
                            <xsl:value-of select="/notification_data/po/ship_to_address/postal_code" /></td>
                        </tr>
                        <xsl:if test="/notification_data/po/shipping_method != ''">
                            <tr />
                            <tr>
                                <td>
                                <b>@@shipping_method@@:</b>&#160;
                                <xsl:value-of select="/notification_data/po/shipping_method" /></td>
                                <td></td>
                            </tr>
                        </xsl:if>
                    </table>
                </xsl:for-each>
                <br />
                <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                        <!-- style.xsl -->
                        <xsl:call-template name="mainTableStyleCss" />
                    </xsl:attribute>
                    <tr>
                        <th></th>
                        <th>PO Number / @@po_line_number@@</th>
                        <th>@@issn_isbn@@</th>
                        <th>@@title@@</th>
                        <th>Fund</th>
                        <th>@@quantity@@</th>
                        <th align="right">@@price@@</th>
                        <th>@@note@@</th>
                    </tr>
                    <xsl:for-each select="notification_data/po/po_line_list/po_line">
                        <tr>
                            <td>
                                <xsl:value-of select="position()" />
                            </td>
                            <td>
                            <xsl:value-of select="ancestor::po/number" />&#160;/
                            <xsl:value-of select="line_reference" /></td>
                            <td>
                            <xsl:value-of select="identifier_type" />&#160;
                            <xsl:value-of select="identifier" /></td>
                            <td>
                                <xsl:value-of select="meta_data_values/title" />
                            </td>
                            <td>
                                <xsl:value-of select="funds_transaction_items/funds_transaction_item/fund/code" />
                            </td>
                            <td>
                                <xsl:value-of select="total_quantity" />
                            </td>
                            <td align="right">
                            <xsl:value-of select="total_price_compose/currency" />&#160;
                            <xsl:value-of select="total_price_compose/sum" /></td>
                            <td>
                                <xsl:value-of select="vendor_note" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <br />
                <table cellspacing="0" cellpadding="5" border="0">
                    <tr>
                        <td>Please include both the PO Number and the PO Line Number on your invoice. Kindly direct any questions regarding this order to
                        <a href="mailto:libacq@smu.edu.sg">libacq@smu.edu.sg</a>. Thank you.</td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
