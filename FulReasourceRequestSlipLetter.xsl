<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20161101 by Wee Hiong
    1. Rearrange the order of the elements in the slip. All styles are hardcoded inline.
    2. Remove unused references to templates.
    3. Standardize case on labels.

    Modified on 20161031 by Wee Hiong
    1. Remove unused reference to senderReceiver.xsl.

    Modified on 20150825 by Wee Hiong
    1. Fix incorrect request creation date.
    2. Display 3 dates:
        - Request Made
        - Notification Sent
        - Expires On

    Modified on 20150824 by Wee Hiong
    1. Reorder the elements on the hold slip:
        - Requester
        - Request type
        - Destination library
        - Specific item warning
        - Request date
        - Expiry date
        - Request ID
        - Item barcode
        - Title
        - Call number
        - Additional metadata
    2. Hide the repeated requester name.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="header.xsl" />
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
                <xsl:if test="notification_data/request_type != 'Patron physical item request'">
                    <h2>
                        <b>@@requested_for@@:
                        <xsl:value-of select="notification_data/user_for_printing/name" /></b>
                    </h2>
                </xsl:if>
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                            <xsl:choose>
                                <xsl:when test="notification_data/request_type = 'Patron physical item request'">
                                    <tr>
                                        <td style="text-align: center">
                                            <span style="font-size: xx-large"><b>[[ HOLD ]]</b></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span style="font-size: large; text-decoration: underline"><b><xsl:value-of select="notification_data/user_for_printing/name" /></b></span>
                                        </td>
                                    </tr>
                                    <xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
                                        <tr>
                                            <td>
                                                <span style="font-size: large"><b><xsl:value-of select="notification_data/phys_item_display/barcode" /></b></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-size: large"><b><xsl:call-template name="recordTitle" /></b></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-size: large"><b><xsl:value-of select="notification_data/phys_item_display/call_number" /></b></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-size: small">@@location@@: <xsl:value-of select="notification_data/phys_item_display/location_name" /></span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/create_date != ''">
                                        <tr>
                                            <td>
                                                <span style="font-size: small">Request made: <xsl:value-of select="notification_data/request/create_date" /></span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/work_flow_entity/create_date != ''">
                                        <tr>
                                            <td>
                                                <span style="font-size: small">Notification sent: <xsl:value-of select="notification_data/request/work_flow_entity/create_date" /></span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/work_flow_entity/expiration_date != ''">
                                        <tr>
                                            <td>
                                                <span style="font-size: large"><b>Expires on: <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date" /></b></span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <td style="text-align: center">
                                            <img src="cid:request_id_barcode.png" alt="Request Barcode" />
                                        </td>
                                    </tr>
                                    <xsl:if test="notification_data/request/system_notes != ''">
                                        <tr>
                                            <td>
                                                <span style="font-size: large"><b>@@system_notes@@: <xsl:value-of select="notification_data/request/system_notes" /></b></span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/note != ''">
                                        <tr>
                                            <td>
                                                <span style="font-size: large"><b>@@request_note@@: <xsl:value-of select="notification_data/request/note" /></b></span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td>
                                        <b>@@request_type@@:</b>&#160;
                                        <xsl:value-of select="notification_data/request_type" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <b>@@move_to_library@@:</b>&#160;
                                        <xsl:value-of select="notification_data/destination" /></td>
                                    </tr>
                                    <xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
                                        <tr>
                                            <td>
                                                <b>@@note_item_specified_request@@.</b>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/manual_description != ''">
                                        <tr>
                                            <td>
                                            <b>@@please_note@@:</b>@@manual_description_note@@ -
                                            <xsl:value-of select="notification_data/request/manual_description" /></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/create_date != ''">
                                        <tr>
                                            <td>
                                            <b>Request Made:</b>&#160;
                                            <xsl:value-of select="notification_data/request/create_date" /></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/work_flow_entity/create_date != ''">
                                        <tr>
                                            <td>
                                            <b>Notification Sent:</b>&#160;
                                            <xsl:value-of select="notification_data/request/work_flow_entity/create_date" /></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/work_flow_entity/expiration_date != ''">
                                        <tr>
                                            <td>
                                                <b>Expires On:&#160;
                                                <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date" /></b>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <td>
                                        <b>@@request_id@@:</b>&#160;
                                        <img src="cid:request_id_barcode.png" alt="Request Barcode" /></td>
                                    </tr>
                                    <xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
                                        <tr>
                                            <td>
                                                <h2>
                                                    <xsl:value-of select="notification_data/phys_item_display/barcode" />
                                                </h2>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/external_id != ''">
                                        <tr>
                                            <td>
                                            <b>@@external_id@@:</b>&#160;
                                            <xsl:value-of select="notification_data/external_id" /></td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <td>
                                            <h2>
                                                <xsl:call-template name="recordTitle" />
                                            </h2>
                                        </td>
                                    </tr>
                                    <xsl:if test="notification_data/phys_item_display/call_number != ''">
                                        <tr>
                                            <td>
                                                <h2>
                                                    <xsl:value-of select="notification_data/phys_item_display/call_number" />
                                                </h2>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/phys_item_display/isbn != ''">
                                        <tr>
                                            <td>@@isbn@@:
                                            <xsl:value-of select="notification_data/phys_item_display/isbn" /></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/phys_item_display/issn != ''">
                                        <tr>
                                            <td>@@issn@@:
                                            <xsl:value-of select="notification_data/phys_item_display/issn" /></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/phys_item_display/edition != ''">
                                        <tr>
                                            <td>@@edition@@:
                                            <xsl:value-of select="notification_data/phys_item_display/edition" /></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/phys_item_display/imprint != ''">
                                        <tr>
                                            <td>@@imprint@@:
                                            <xsl:value-of select="notification_data/phys_item_display/imprint" /></td>
                                        </tr>
                                    </xsl:if>
                                    <b></b>
                                    <tr>
                                        <td>@@location@@:
                                        <xsl:value-of select="notification_data/phys_item_display/location_name" /></td>
                                    </tr>
                                    <xsl:if test="notification_data/phys_item_display/accession_number != ''">
                                        <tr>
                                            <td>
                                                <h2>
                                                <b>@@accession_number@@:</b>&#160;
                                                <xsl:value-of select="notification_data/phys_item_display/accession_number" /></h2>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/phys_item_display/shelving_location/string">
                                        <xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
                                            <tr>
                                                <td>
                                                <b>@@shelving_location_for_item@@:</b>&#160;
                                                <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
                                                <xsl:value-of select="." />&#160;</xsl:for-each></td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="notification_data/request/selected_inventory_type='HOLDING'">
                                            <tr>
                                                <td>
                                                <b>@@shelving_locations_for_holding@@:</b>&#160;
                                                <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
                                                <xsl:value-of select="." />&#160;</xsl:for-each></td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'">
                                            <tr>
                                                <td>
                                                <b>@@shelving_locations_for_holding@@:</b>&#160;
                                                <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
                                                <xsl:value-of select="." />&#160;</xsl:for-each></td>
                                            </tr>
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="notification_data/phys_item_display/display_alt_call_numbers/string">
                                        <xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
                                            <tr>
                                                <td>
                                                <b>@@alt_call_number@@:</b>&#160;
                                                <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
                                                <xsl:value-of select="." />&#160;</xsl:for-each></td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="notification_data/request/selected_inventory_type='HOLDING'">
                                            <tr>
                                                <td>
                                                <b>@@alt_call_number@@:</b>&#160;
                                                <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
                                                <xsl:value-of select="." />&#160;</xsl:for-each></td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'">
                                            <tr>
                                                <td>
                                                <b>@@alt_call_number@@:</b>&#160;
                                                <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
                                                <xsl:value-of select="." />&#160;</xsl:for-each></td>
                                            </tr>
                                        </xsl:if>
                                    </xsl:if>
                                    <b></b>
                                    <xsl:if test="notification_data/request/system_notes != ''">
                                        <tr>
                                            <td>
                                            <b>@@system_notes@@:</b>&#160;
                                            <xsl:value-of select="notification_data/request/system_notes" /></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="notification_data/request/note != ''">
                                        <tr>
                                            <td>
                                            <b>@@request_note@@:</b>&#160;
                                            <xsl:value-of select="notification_data/request/note" /></td>
                                        </tr>
                                    </xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                        </table>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
