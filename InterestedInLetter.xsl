<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20160707 by Wee Hiong
  1. Add do-not-reply message to the footer.

  Modified on 20151222 by Wee Hiong
  1. Remove sender's address as contact information is now inside the header.
  2. Add link to library account.

  Modified on 20150909 by Wee Hiong
  1. Omit call number if not available.
  2. Print location if available.

  Modified on 20150824 by Wee Hiong
  1. Replace all references to orders with the term titles, and stop the order number from displaying.
  2. Add line to inform user about delay of information in Primo.
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
        <xsl:call-template name="toWhomIsConcerned" />@@You_were_specify@@:
        <br />
        <table cellspacing="0" cellpadding="5" border="0">
          <tr>
            <td>
              <br />@@title@@:
              <br />
            </td>
            <td>
              <br />
              <xsl:value-of select="notification_data/title" />
              <br />
            </td>
          </tr>
          <xsl:if test="notification_data/poline_inventory/call_number != ''">
            <tr>
              <td>
                <br />@@callNumber@@:
                <br />
              </td>
              <td>
                <br />
                <xsl:value-of select="notification_data/poline_inventory/call_number" />
                <br />
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="notification_data/poline_inventory/location/location_name_for_display != ''">
            <tr>
              <td>
                <br />Location:
                <br />
              </td>
              <td>
                <br />
                <xsl:value-of select="notification_data/poline_inventory/location/location_name_for_display" />
                <br />
              </td>
            </tr>
          </xsl:if>
          <tr>
            <td>
              <br />@@message@@:
              <br />
            </td>
            <td>
              <br />
              <xsl:value-of select="notification_data/message" />
              <br />
            </td>
          </tr>
        </table>
        <br />
        Please note that new additions to the library may take up to 24 hours before appearing in the library catalogue.
        <br />
        <!-- footer.xsl -->
        <xsl:call-template name="myAccount" />
        <xsl:call-template name="doNotReply" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
