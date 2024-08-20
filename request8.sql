*/
8. In which quarter of 2020, got the maximum total_sold_quantity?
*/


SELECT 
	CASE
		WHEN MONTH(date) IN (9,10,11) THEN 'Q1'
		WHEN MONTH(date) IN (12,1,2) THEN 'Q2'
		WHEN MONTH(date) IN (3,4,5) THEN 'Q3'
		WHEN MONTH(date) IN (6,7,8) THEN 'Q4' 
		END AS quarter
	ROUND(SUM(sold_quantity)/100000,2) AS total_sold_quantity_in_million
FROM
	 fact_sales_monthly 
WHERE 
	 fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity_in_million


