<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20160707 by Wee Hiong
  1. Add do-not-reply message to the footer.

  Modified on 20151222 by Wee Hiong
  1. Remove call to empty salutations template.

  Modified on 20151113 by Wee Hiong
  1. Use the letterText variable instead of hardcoded text.

  Modified on 20150827 by Wee Hiong
  1. Removed footer.
  2. Put report name after introduction statement.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="mailReason.xsl" />
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
        <!-- mailReason.xsl -->
        <xsl:call-template name="toWhomIsConcerned" />
        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  @@letterText@@
                  <br />
                  <b><xsl:value-of select="/notification_data/report_name" /></b>
                </td>
              </tr>
            </table>
            <br />
            <!-- footer.xsl -->
            <xsl:call-template name="doNotReply" />
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
