/* 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to 
get an idea of low and high-performing months and take strategic decisions. 
The final report contains these columns: Month Year Gross sales Amount */

-- gdb023.dim_customer
-- gdb023.fact_gross_price
-- gdb023.fact_sales_monthly

SELECT 
    concat(MONTHNAME(date), ' (', year(date), ')') AS month,
    sm.fiscal_year,
    SUM(gross_price * sold_quantity) AS gross_sales_amount
FROM
    gdb023.fact_gross_price gp
        INNER JOIN
    gdb023.fact_sales_monthly sm USING (product_code)
        INNER JOIN
    gdb023.dim_customer dm USING (customer_code)
WHERE
    customer = 'Atliq Exclusive'
GROUP BY month, fiscal_year
ORDER BY 2 DESC;