/* 5. Get the products that have the highest and lowest manufacturing costs. 
The final output should contain these fields, product_code product manufacturing_cost */

-- gdb023.dim_product;
-- gdb023.fact_manufacturing_cost

SELECT 
    dp.product_code, product, manufacturing_cost
FROM
    gdb023.dim_product dp
        INNER JOIN
    gdb023.fact_manufacturing_cost mc ON dp.product_code = mc.product_code
WHERE
    manufacturing_cost IN (SELECT 
            MAX(manufacturing_cost)
        FROM
            gdb023.fact_manufacturing_cost)
        OR manufacturing_cost IN (SELECT 
            MIN(manufacturing_cost)
        FROM
            gdb023.fact_manufacturing_cost)
ORDER BY 3 DESC;