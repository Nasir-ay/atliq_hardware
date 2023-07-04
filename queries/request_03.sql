/* 3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. 
The final output contains 2 fields, segment product_count */

SELECT 
    segment, COUNT(DISTINCT product_code) AS product_count
FROM
    gdb023.dim_product
GROUP BY 1
ORDER BY 2 DESC;