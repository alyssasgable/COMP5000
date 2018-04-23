<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />
    <!--
   <xsl:param name="csv-encoding" as="xs:string" select="'iso-8859-1'"/>
    -->
    <!--
    <xsl:param name="csv-uri" as="xs:string" select="'file:///C:/Users/alyssa/projects/COMP5000/Assignment3/tgerentals.txt'"/> 
   -->
   <xsl:template match="customers">
       <html>
        <body>
            <h1>Current Rentals</h1>
            <h2>July 17, 2017</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Customer</th>
                        <th>ToolID</th>
                        <th>Tool</th>
                        <th>Category</th>
                        <th>Due Back</th>
                        <th>Charge</th>
                    </tr>
                    <xsl:variable name="customer" select="document('tgecustomers.xml')/customers/customer[@customer=current-grouping-key()]"/>
                    <xsl:variable name="rental" select="doc('tgerentals.xml')/rentals/rental[@Customer=current-grouping-key()]"/>
                    <xsl:variable name="tool" select="doc('tgetools.xml')/equipment/tool[@toolID=rental/Tool]"/>
                    
                    <xsl:for-each select="customers/customer">
                    <!--
                         <xsl:sort select="current-grouping-key()"/>
                    -->
                    <tr>
                        <td>
                            <xsl:value-of select="customer/firstName"/> <xsl:value-of select="customer/lastName"/>
                            <xsl:text>&#xa;</xsl:text>
                            <xsl:value-of select="customer/street"/>
                            <xsl:text>&#xa;</xsl:text>
                            <xsl:value-of select="customer/city"/>, <xsl:value-of select="customer/state"/>
                            <xsl:value-of select="customer/ZIP"/>
                        </td>
                        <td><xsl:value-of select="tool/toolID"/></td>
                        <td><xsl:value-of select="equipment/description"/></td>
                        <td><xsl:value-of select="equipment/category"/></td>
                        <td><xsl:value-of select="dueback"/></td>
                        <td><xsl:value-of select="charge"/></td>
                    </tr>
                    </xsl:for-each>
                </table>
         </body>
        </html>
   </xsl:template>

</xsl:stylesheet>

