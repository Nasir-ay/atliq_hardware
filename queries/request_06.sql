/* 6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 
2021 and in the Indian market. The final output contains these fields, customer_code customer average_discount_percentage */

-- gdb023.dim_customer
-- gdb023.fact_pre_invoice_deductions

SELECT 
    dc.customer_code,
    customer,
    ROUND(AVG(pre_invoice_discount_pct) * 100, 2) AS average_discount_percentage
FROM
    gdb023.dim_customer dc
        INNER JOIN
    gdb023.fact_pre_invoice_deductions pid USING (customer_code)
WHERE
    fiscal_year = 2021 AND market = 'India'
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 5;