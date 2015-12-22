<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20151222 by Wee Hiong
    1. Insert style for contact information in the header.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="generalStyle">
        <style>
            body {
                background-color: #fff
            }

            .listing td {
                border-bottom: 1px solid #eee
            }

            .listing tr:hover td {
                background-color: #eee
            }

            .listing th {
                background-color: #f5f5f5
            }

            h4 {
                line-height: 0.2em
            }
        </style>
    </xsl:template>
    <xsl:template name="bodyStyleCss">
        font-family: arial;
        color: #333;
        margin: 0;
        padding: 0;
        font-size: 80%
    </xsl:template>
    <xsl:template name="listStyleCss">
        list-style: none;
        margin: 0 0 0 1em;
        padding: 0
    </xsl:template>
    <xsl:template name="headerContactInfoStyleCss">
        list-style: none;
        margin: 0 0 0 1em;
        padding: 0;
        font-size: 80%;
        line-height: 85%;
        color: #666
    </xsl:template>
    <xsl:template name="mainTableStyleCss">
        width: 100%;
        text-align: left
    </xsl:template>
    <xsl:template name="headerLogoStyleCss">
        background-color: #ffffff;
        width: 100%
    </xsl:template>
    <xsl:template name="headerTableStyleCss">
        background-color: #e9e9e9;
        width: 100%;
        height: 30px;
        text-shadow: 1px 1px 1px #fff
    </xsl:template>
    <xsl:template name="footerTableStyleCss">
        background-color: #444;
        width: 100%;
        text-shadow: 1px 1px 1px #333;
        color: #fff;
        margin-top: 1em;
        font-weight: 700;
        line-height: 2em;
        font-size: 150%
    </xsl:template>
</xsl:stylesheet>
