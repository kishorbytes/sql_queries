*/
6. Generate a report which contains the top 5 customers who received an average
  high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.
*/

SELECT
	c.customer_code, customer,
	RONUD(AVG(pre_invoice_discount_pct)*100,2) AS average_discount_percentage
FROM dim_customer c
LEFT JOIN fact_pre_invoice_deductions d
ON c.customer_code = d.customer_code
WHERE 
	fiscal_year = 2021
	AND
	sub_zone = 'India'
GROUP BY c.customer_code
ORDER BY average_discount_percentage DESC
	



