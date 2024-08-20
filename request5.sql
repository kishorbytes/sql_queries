*/
5. Get the products that have the highest and lowest manufacturing costs.
*/



SELECT
	mc.product_code, product, manufacturing_cost
FROM
	fact_manufacturing_cost AS mc 
LEFT JOIN dim_product p
ON p. product_code, mc.product_code

WHERE 
	manufacturing cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
	OR
	manufacturing cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
ORDER BY 
	product_count DESC 

	




