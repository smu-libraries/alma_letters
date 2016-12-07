<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20161207 by Wee Hiong
  1. Format code.
  2. Remove unused references.
  3. Remove unused templates in the footer.
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
              <tr>
                <td>
                  <br />
                  <b>@@first_part@@</b>
                  <xsl:value-of select="/notification_data/process"/>
                  <b>@@second_part@@</b>
                  <br />
                  <b><xsl:value-of select="/notification_data/ftp"/></b>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <br />
        <!-- footer.xsl -->
        <xsl:call-template name="doNotReply" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
