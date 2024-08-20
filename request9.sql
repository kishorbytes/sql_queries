*/
9. Which channel helped to bring more gross sales in the fiscal year 2021 and 
the percentage of contribution? 
*/


WITH cte AS (
	SELECT c.channel, 
		SUM(s.sold_quantity * g.gross_price) AS total_sales
	FROM fact_sales_monthly AS s 	
	JOIN fact_gross_price AS g using(product_code)
	JOIN dim_customer AS c using(customer_code)
                  WHERE s.fiscal_year = 2021
	GROUP BY c.channel
	ORDER_BY total_sales DESC 
	)

SELECT  channel1,
	CONCAT(ROUND(total_sales / 1000000, 2), 'M') AS 	gross_sales_in_millions,
	CONCAT(ROUND(total_sales / SUM(total_sales) OVER () * 100, 2), '%') AS 	percenatge
FROM  cte 


