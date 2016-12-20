<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20161220 by Wee Hiong
  1. Remove template for libchanges2016 message.

  Modified on 20160811 by Wee Hiong
  1. Add template for libchanges2016 message (about change to 3-hour loans).

  Modified on 20160707 by Wee Hiong
  1. Add do-not-reply message to the footer.

  Modified on 20151218 by Wee Hiong
  1. Align the library account link to the center.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="salutation" />
  <xsl:template name="lastFooter">
    <table>
      <xsl:attribute name="style">
        <!-- style.xsl -->
        <xsl:call-template name="footerTableStyleCss" />
      </xsl:attribute>
      <tr>
        <xsl:for-each select="notification_data/organization_unit">
          <xsl:attribute name="style">
            <!-- style.xsl -->
            <xsl:call-template name="listStyleCss" />
          </xsl:attribute>
          <td align="center">
            <xsl:value-of select="name" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="line1" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="line2" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="city" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="postal_code" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="country" />
          </td>
        </xsl:for-each>
      </tr>
    </table>
  </xsl:template>
  <xsl:template name="contactUs">
    <table align="left">
      <tr>
        <td align="left">
          <a>
            <xsl:attribute name="href">@@email_contact_us@@</xsl:attribute>
            @@contact_us@@
          </a>
        </td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template name="myAccount">
    <table align="center">
      <tr>
        <td>
          <a>
            <xsl:attribute name="href">@@email_my_account@@</xsl:attribute>
            @@my_account@@
          </a>
        </td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template name="doNotReply">
    <table align="center">
      <tr>
        <td>
          ** This is a system generated email. Please do not reply to this message. **
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
