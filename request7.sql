*/
7. Get the complete report of the Gross sales amount for the customer Atliq Exclusive for each month.
*/

SELECT 
	CONCAT(MONTHNAME(f.date), ' '  , YEAR (f.date)) AS 'Month', f.fiscal_year,
	CONCAT(ROUND(SUM(g.gross_price *f.sold_quantity)/100000,2), 'M') AS gross_sales_amount	
FROM
	fact_sales_monthly AS f
	JOIN dim_customer AS c
	      ON f.customer_code = c.customer_code
	JOIN fact_gross_price AS g
	       ON f.product_code = g.product_code	
WHERE 
	c.customer = 'Atliq Exclusive'
GROUP BY month, f.fiscal_year
ORDER BY  f.fiscal_year


