<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
		version="1.0"  
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		>
	<xsl:param name="sortField"/>
	<xsl:param name="sortType"/>
	<xsl:param name="sortOrder"/>
	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<table width="90%" align="center">
			<tr>
				<th><a href='javascript:sortIt("name", "text", "ascending")'>Name</a></th>
				<th><a href='javascript:sortIt("hits", "number", "descending")'>Hits</a></th>
				<th><a href='javascript:sortIt("totalTime", "number", "descending")'>Total Time</a></th>
				<th><a href='javascript:sortIt("average", "number", "descending")'>Average</a></th>
				<th><a href='javascript:sortIt("trimmedAverage", "number", "descending")'>Trimmed Avg.</a></th>
			</tr>
			<xsl:apply-templates select="//timer/intervals/interval">
				<xsl:sort select="*[name()=$sortField]" 
						data-type="{$sortType}" order="{$sortOrder}"/>
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template match="//timer/intervals/interval">
		<tr>		
			<td><xsl:value-of select="name" /></td>
			<td align="RIGHT"><xsl:value-of select="hits" /></td>
			<td align="RIGHT"><xsl:value-of select="totalTime" /></td>
			<td align="RIGHT"><xsl:value-of select="average" /></td>
			<td align="RIGHT"><xsl:value-of select="trimmedAverage" /></td>
		</tr>
	</xsl:template>

	<xsl:template match="*"/>

</xsl:stylesheet>
