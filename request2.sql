*/
2. What is percentage of unique product increase in 2020 vs. 2021?
*/


WITH cte1 AS (
	SELECT product_code,  COUNT(DISTICT(product_code)) AS pr_2020
	FROM fact_sales_monthly	
	WHERE fiscal_year = 2020
	),

cte2 AS (
	SELECT product_code,  COUNT(DISTICT(product_code)) AS pr_2021
	FROM fact_sales_monthly	
	WHERE fiscal_year = 2021
	)

SELECT  pr_2020 AS unique_products_2020, pr_2021 AS unique_products_2021,
		ROUND((pr_2021 - pr_2020)*100/pr_2020, 2) AS percentage_chg	
FROM  cte1 JOIN cte2



