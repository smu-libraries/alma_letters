<?xml version="1.0" encoding="utf-8"?>
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
                  <xsl:choose>
                    <xsl:when test="/notification_data/purchase_request/request_status='APPROVED'">
                      @@approved@@
                    </xsl:when>
                    <xsl:otherwise>
                      @@rejected@@
                      <xsl:choose>
                        <xsl:when test="notification_data/purchase_request/reject_reason_desc='Cost'">
                          the cost of the book.
                        </xsl:when>
                        <xsl:when test="notification_data/purchase_request/reject_reason_desc='Irrelevant'">
                          the lack of subject relevance to our collection.
                        </xsl:when>
                        <xsl:when test="notification_data/purchase_request/reject_reason_desc='Duplicate'">
                          a duplicated order for the same book.
                        </xsl:when>
                        <xsl:otherwise>
                          unforseen circumstances.
                        </xsl:otherwise>
                      </xsl:choose>
                      We apologize for the inconvenience caused. Please contact <a href="mailto:libacq@smu.edu.sg">our staff</a> if you require further assistance.
                    </xsl:otherwise>
                  </xsl:choose>
                  <br />
                  <br />
                  @@title@@:
                  <xsl:value-of select="notification_data/purchase_request/title" />
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
