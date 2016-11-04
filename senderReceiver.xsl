<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20151217 by Wee Hiong
  1. Exclude the library name but print all three address lines in the contact information.

  Modified on 20150812 by Wee Hiong
  1. Hide the recipient's name and address (removed the entire left-hand side).
  2. Hide address line 2 (blank) and redundant country in the sender's address.
  3. Combine city and postal code into one line in the sender's address.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="senderReceiver">
    <table cellspacing="0" cellpadding="5" border="0" width="100%">
      <tr>
        <td width="50%"></td>
        <td width="50%" align="right">
          <xsl:for-each select="notification_data/organization_unit">
            <table>
              <!-- style.xsl -->
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss" />
              </xsl:attribute>
              <tr>
                <td>
                  <xsl:value-of select="address/line1" />
                </td>
              </tr>
              <tr>
                <td>
                  <xsl:value-of select="address/line2" />
                </td>
              </tr>
              <tr>
                <td>
                  <xsl:value-of select="address/line3" />
                </td>
              </tr>
              <tr>
                <td>
                  <xsl:value-of select="address/city" />
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="address/postal_code" />
                </td>
              </tr>
              <tr />
              <tr>
                <td>Tel: <xsl:value-of select="phone/phone" /></td>
              </tr>
              <tr>
                <td>Email:
                  <a>
                    <xsl:attribute name="href">mailto:
                      <xsl:value-of select="email/email" />
                    </xsl:attribute>
                    <xsl:value-of select="email/email" />
                  </a>
                </td>
              </tr>
            </table>
          </xsl:for-each>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
