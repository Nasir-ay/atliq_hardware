/* 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
The final output contains these fields; channel, gross_sales_mln, percentage */

-- gdb023.dim_customer
-- gdb023.fact_gross_price
-- gdb023.fact_sales_monthly

with gs as
(select channel, sum(gross_price*sold_quantity)/1000000 as gross_sales_mln
from gdb023.dim_customer dc 
	inner join 
    gdb023.fact_sales_monthly sm using (customer_code)
	inner join 
    gdb023.fact_gross_price gp using (product_code)
where gp.fiscal_year = 2021
group by 1)
select channel, gross_sales_mln, round(gross_sales_mln/sum(gross_sales_mln) over () * 100, 2) as percentage 
from gs
group by 1
order by 3 desc;

-- gross sales divided by 1,000,000 to give gross sales in millions (mln)