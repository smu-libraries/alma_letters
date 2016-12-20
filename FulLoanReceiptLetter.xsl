<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20161220 by Wee Hiong
  1. Remove libchanges2016 message.

  Modified on 20161219 by Wee Hiong
  1. Update course reserve location codes.
  2. Repurpose the variable @@dear@@ for the reserve item message.

  Modified on 20161031 by Wee Hiong
  1. Inform user about returning reserve item to owning library.

  Modified on 20160811 by Wee Hiong
  1. Insert libchanges2016 message (about change to 3-hour loans).

  Modified on 20160811 by Wee Hiong
  1. Inform user about shortened due date if item is under reservation.

  Modified on 20160707 by Wee Hiong
  1. Add do-not-reply message to the footer.

  Modified on 20151222 by Wee Hiong
  1. Remove sender's address as contact information is now inside the header.
  2. Add link to library account.
  3. Remove loans header.

  Modified on 20151215 by Wee Hiong
  1. Removed SMU15 promotion message.

  Modified on 20150908 by Salihin
  1. Added SMU15 programme promotion at end of message.

  Modified on 20150810 by Wee Hiong
  1. Removed description column.
  2. Added call number column.
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
                  <h>@@inform_loaned_items@@</h>
                </td>
              </tr>
              <tr>
                <td>
                  <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                      <!-- style.xsl -->
                      <xsl:call-template name="mainTableStyleCss" />
                    </xsl:attribute>
                    <tr>
                      <th>@@title@@</th>
                      <th>Call Number</th>
                      <th>@@author@@</th>
                      <th>@@loan_date@@</th>
                      <th>@@due_date@@</th>
                      <th>@@library@@</th>
                    </tr>
                    <xsl:for-each select="notification_data/items/item_loan">
                      <tr>
                        <td>
                          <xsl:value-of select="title" />
                        </td>
                        <td>
                          <xsl:value-of select="call_number" />
                        </td>
                        <td>
                          <xsl:value-of select="author" />
                        </td>
                        <td>
                          <xsl:value-of select="loan_date" />
                          <xsl:if test="due_date_shortened_reason='RECALL'"><b>*</b></xsl:if>
                        </td>
                        <td>
                          <xsl:value-of select="new_due_date_str" />
                        </td>
                        <td>
                          <xsl:value-of select="library_name" />
                          <xsl:if test="location_code='CR3H' or location_code='CRMedia' or location_code='3DaysL4' or location_code='3 Days L3' or location_code='3 Days L4'"><b>#</b></xsl:if>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                </td>
              </tr>
              <xsl:if test="//item_loan/due_date_shortened_reason[text()]='RECALL'">
                <tr>
                  <td><b>* Loan period is shortened due to reservation by another user.</b></td>
                </tr>
              </xsl:if>
              <xsl:if test="//item_loan/location_code[text()]='CR3H' or //item_loan/location_code[text()]='CRMedia' or //item_loan/location_code[text()]='3DaysL4' or //item_loan/location_code[text()]='3 Days L3' or //item_loan/location_code[text()]='3 Days L4'">
                <tr>
                  <td><b># @@dear@@</b></td>
                </tr>
              </xsl:if>
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
