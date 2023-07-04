/* 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
The final output contains these fields; segment, product_count_2020, product_count_2021, difference */

-- gdb023.fact_sales_monthly
-- gdb023.dim_product

with pc_2020 as
(select segment, count(distinct dp.product_code) as product_count_2020
FROM gdb023.dim_product dp
inner join gdb023.fact_sales_monthly sm
on dp.product_code = sm.product_code
where fiscal_year = 2020
group by 1),
pc_2021 as
(select segment, count(distinct dp.product_code) as product_count_2021
FROM gdb023.dim_product dp
inner join gdb023.fact_sales_monthly sm
on dp.product_code = sm.product_code
where fiscal_year = 2021
group by 1)
select pc_2020.segment, product_count_2020, product_count_2021, product_count_2021-product_count_2020 as difference
from pc_2020
join pc_2021 using (segment)
group by 1
order by 4 desc;