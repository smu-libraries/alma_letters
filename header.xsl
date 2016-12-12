<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20161212 by Wee Hiong
  1. Change all links to the library website from HTTP to HTTPS.

  Modified on 20151222 by Wee Hiong
  1. Add contact information into the header on the right side of the logo.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="head">
    <table cellspacing="0" cellpadding="5" border="0">
      <xsl:attribute name="style">
        <!-- style.xsl -->
        <xsl:call-template name="headerTableStyleCss" />
      </xsl:attribute>
      <!-- Logo and sender's address -->
      <tr>
        <xsl:attribute name="style">
          <!-- style.xsl -->
          <xsl:call-template name="headerLogoStyleCss" />
        </xsl:attribute>
        <td width="70%">
          <div id="mailHeader">
            <div id="logoContainer" class="alignLeft">
              <img src="cid:logo.jpg" alt="logo" />
            </div>
          </div>
        </td>
        <td align="right">
          <xsl:for-each select="notification_data/organization_unit">
            <table>
              <xsl:attribute name="style">
                <!-- style.xsl -->
                <xsl:call-template name="headerContactInfoStyleCss" />
              </xsl:attribute>
              <tr>
                <td>Tel: <xsl:value-of select="phone/phone" /></td>
              </tr>
              <tr>
                <td>Email:
                  <a>
                    <xsl:attribute name="href">
                      mailto:<xsl:value-of select="email/email" />
                    </xsl:attribute>
                    <xsl:value-of select="email/email" />
                  </a>
                </td>
              </tr>
              <tr>
                <td>Website:
                  <a>
                    <xsl:attribute name="href">
                      https://library.smu.edu.sg
                    </xsl:attribute>
                    library.smu.edu.sg
                  </a>
                </td>
              </tr>
              <tr>
                <td>
                  <a>
                    <xsl:attribute name="href">
                      https://library.smu.edu.sg/library/opening-hours
                    </xsl:attribute>
                    Opening hours
                  </a>
                </td>
              </tr>
            </table>
          </xsl:for-each>
        </td>
      </tr>
      <tr>
        <xsl:for-each select="notification_data/general_data">
          <td>
            <h1>
              <xsl:value-of select="letter_name" />
            </h1>
          </td>
          <td align="right">
            <xsl:value-of select="current_date" />
          </td>
        </xsl:for-each>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
