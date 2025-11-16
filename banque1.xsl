<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">   
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé de Compte</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    h1, h2 { color: #333; }
                    table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    .totals p { font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Relevé de Compte</h1>
                <p><b>RIB :</b> <xsl:value-of select="/releve/@RIB"/></p>
                <p><b>Date du relevé :</b> <xsl:value-of select="/releve/dateReleve"/></p>
                <p><b>Solde :</b> <xsl:value-of select="/releve/solde"/></p>
                
                <h2>Opérations (du <xsl:value-of select="/releve/operations/@dateDebut"/> au <xsl:value-of select="/releve/operations/@dateFin"/>)</h2>
                <table>
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="/releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <div class="totals">
                    <h2>Totaux</h2>
                    <p>Total Crédit : <xsl:value-of select="sum(/releve/operations/operation[@type='CREDIT']/@montant)"/></p>
                    <p>Total Débit : <xsl:value-of select="sum(/releve/operations/operation[@type='DEBIT']/@montant)"/></p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>