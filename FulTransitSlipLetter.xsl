<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20171101 by Wee Hiong
  1. Remove header, footer, etc. used sections.
  2. Remove unused references to templates.
  3. Rearrange the order of elements in the slip. All styles are hardcoded inline.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:template match="/">
    <html>
      <head>
        <!-- style.xsl -->
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td style="text-align: center">
                  <span style="font-size: xx-large"><b>TRANSIT &gt;&gt;&gt;</b></span>
                </td>
              </tr>
              <tr>
                <td>
                  <span style="font-size: large; text-decoration: underline"><b><xsl:value-of select="notification_data/request/calculated_destination_name" /></b></span>
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
              </xsl:if>
              <tr>
                <td>
                  <span style="font-size: small">@@from@@: <xsl:value-of select="notification_data/request/assigned_unit_name" /></span>
                </td>
              </tr>
              <xsl:if test="notification_data/request/create_date != ''">
                <tr>
                  <td>
                    <span style="font-size: small">@@transfer_date@@: <xsl:value-of select="notification_data/request/create_date" /></span>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/create_time != ''">
                <tr>
                  <td>
                    <span style="font-size: small">@@transfer_time@@: <xsl:value-of select="notification_data/request/create_time" /></span>
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
            </table>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
