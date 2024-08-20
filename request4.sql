*/
4. Which segment had the most increase in unique products in 2020 vs 2021?

*/


WITH cte1 AS (
	SELECT product_ dp.segment, COUNT(DISTICT(ms.product_code)) AS product_counts
	FROM fact_sales_monthly AS ms 	
	LEFT JOIN dim_products AS dp ON dp.product_code = ms.product_code
    WHERE ms.fiscal_year = 2020
	GROUP BY dp.segment
	),

    cte2 AS (
	SELECT product_ dp.segment, COUNT(DISTICT(ms.product_code)) AS product_counts
	FROM fact_sales_monthly AS ms	
	LEFT JOIN dim_products AS dp ON dp.product_code = ms.product_code
    WHERE ms.fiscal_year = 2021
	GROUP BY dp.segment
	)

SELECT  cte1.segment, cte1.product_counts  AS product_count_2020, cte2.product_counts AS product_count_2021, 
		(cte2.product_counts - cte2.product_counts) AS difference
FROM  cte1 
LEFT JOIN cte2 ON cte1.segment = cte2.segment
GROUP BY cte1.segment 
ORDER BY difference



