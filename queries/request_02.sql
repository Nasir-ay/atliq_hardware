/* 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
 unique_products_2020, unique_products_2021, percentage_chg */
 
SELECT 
    up_2020.A AS unique_products_2020,
    up_2021.B AS unique_products_2021,
    round(((B - A) / A) * 100, 2) AS percentage_chg
FROM
    ((SELECT 
        COUNT(DISTINCT product_code) AS A
    FROM
        gdb023.fact_sales_monthly
    WHERE
        fiscal_year = 2020) up_2020, (SELECT 
        COUNT(DISTINCT product_code) AS B
    FROM
        gdb023.fact_sales_monthly
    WHERE
        fiscal_year = 2021) up_2021);