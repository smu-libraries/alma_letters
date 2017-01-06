<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20170106 by Wee Hiong
  1. Fix incorrect circulation desk in calculated_destination_name.

  Modified on 20161031 by Wee Hiong
  1. Differentiate between pick up locations.

  Modified on 20160707 by Wee Hiong
  1. Add do-not-reply message to the footer.

  Modified on 20151222 by Wee Hiong
  1. Remove sender's address as contact information is now inside the header.
  2. Add link to library account.
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
                <td>@@following_item_requested_on@@
                  <xsl:value-of select="notification_data/request/create_date" />,
                  @@can_picked_at@@
                  <xsl:choose>
                    <xsl:when test="notification_data/request/calculated_destination_name='Kwa Geok Choo Law Library - Service Desk'">
                      Kwa Geok Choo Law Library Services Desk.
                    </xsl:when>
                    <xsl:otherwise>
                      Li Ka Shing Library Services Desk.
                    </xsl:otherwise>
                  </xsl:choose>
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
