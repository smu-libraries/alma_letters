<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="recordTitle">
        <div class="recordTitle">
            <b>
                <span class="spacer_after_1em">
                    <xsl:value-of select="notification_data/phys_item_display/title" />
                </span>
            </b>
        </div>
        <xsl:if test="notification_data/phys_item_display/author !=''">
            <div class="">
                <span class="spacer_after_1em">
                    <b>
                        <span class="recordAuthor">By:
                        <xsl:value-of select="notification_data/phys_item_display/author" /></span>
                    </b>
                </span>
            </div>
        </xsl:if>
        <xsl:if test="notification_data/phys_item_display/issue_level_description !=''">
            <div class="">
                <span class="spacer_after_1em">
                    <span class="volumeIssue">Description:
                    <xsl:value-of select="notification_data/phys_item_display/issue_level_description" /></span>
                </span>
            </div>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
