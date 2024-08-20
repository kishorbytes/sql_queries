*/
1. Provide the list of markets in which customer “Atliq Exclusive” operates business in the APAC region.
*/

SELECT DISTINCT
	market AS list_of_market
FROM 
	dim_customer
WHERE 
	region = 'APAC'
	AND 
	cutomer = 'Atliq Exclusive'


