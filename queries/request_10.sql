/* 10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
The final output contains these fields; division, product_code, product, total_sold_quantity, rank_order */

-- gdb023.dim_product
-- gdb023.fact_sales_monthly

with top as
(select division, product_code, product, variant, sum(sold_quantity) as total_sold_quantity
from gdb023.dim_product dp 
	join 
    gdb023.fact_sales_monthly sm using (product_code)
where fiscal_year = 2021
group by 4,3,2,1
order by 5),
rank_code as
(select division, product_code, concat(product, ' ', '(',variant, ')') as product, total_sold_quantity, 
rank () over (partition by division order by total_sold_quantity desc) as rank_order from top)
select * from rank_code 
where rank_order in (1,2,3);