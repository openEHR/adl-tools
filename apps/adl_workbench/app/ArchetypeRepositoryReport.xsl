<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Archetype Repository Report</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<link rel="stylesheet" type="text/css" media="all" href="ArchetypeRepositoryReport.css"/>
			</head>
			<body>
				<div id="html-body">
					<xsl:call-template name="generate-statistics"/>
					<br/>
					<xsl:call-template name="generate-errors"/>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- **** generate HTML section templates **** -->

	<xsl:template name="generate-statistics">
		<div id="html-statistics">
			<table id="statistics-table">
				<tbody>
					<xsl:for-each select="/archetype-repository-report/statistics/category">
						<tr>
							<td>
								<xsl:value-of select="@description"/>
							</td>
							<td>
								<xsl:value-of select="@count"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="generate-errors">
		<xsl:for-each select="/archetype-repository-report/category">
			<div id="html-errors">
				<table id="errors-table">
					<tbody>
						<tr>
							<td colspan="2" id="errors-heading">
								<xsl:value-of select="@description"/>
							</td>
						</tr>
						<xsl:for-each select="archetype">
							<tr>
								<td id="errors-cell">
									<xsl:value-of select="@id"/>
								</td>
								<td id="errors-cell">
									<xsl:for-each select="message">
										<xsl:value-of select="text()"/>
										<br/>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
			<br/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
