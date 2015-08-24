<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="toWhomIsConcerned">
		<table cellspacing="0" cellpadding="5" border="0">
			<tr>
				<td>
					<xsl:for-each select="notification_data">
						<h3>@@dear@@ &#160;</h3>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
