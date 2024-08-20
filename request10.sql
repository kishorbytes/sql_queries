*/
10. Get Top 3 products in each division that have A high total_sold_quantity in the fiscal_year 2021

*/


WITH cte1 AS (
	SELECT p.division, s.product_code, p.product, 
	             SUM(s.sold_quantity) As total_sold_quantity
	FROM dim_product AS p	
	LEFT JOIN fact_sales_monthly AS s using(product_code)
	WHERE s.fiscal_year = 2021
	GROUP BY s.product_code, division, p.product
	),
    
	cte2 AS (
	SELECT division, product_code, product_total_sold_quantity,
		RANK() OVER() partition BY division
		ORDER BY total_sold_quantity DESC) AS 'Rank_Order'
	FROM cte1
	) 

SELECT  cte1.division, cte1.product_code , cte1.product, cte1.total_sold_quantity, cte1.rank_order
FROM  cte1 
LEFT JOIN cte2 ON cte1.segment = cte2.segment
GROUP BY cte1.segment 
ORDER BY difference


