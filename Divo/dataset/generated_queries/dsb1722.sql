--dsb_templates_query018_076_ef1feea9-0109-3471-b20f-48cd1c568fe4.sql
--{"gen": "erase", "time": 1.0834050178527832, "template": "query018_076", "dataset": "dsb_templates", "rows": 100}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
item.i_item_id
FROM catalog_sales AS catalog_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item
WHERE (customer_demographics.cd_gender = 'M' AND customer_demographics.cd_education_status = '2 yr Degree' AND date_dim.d_year = 2001 AND catalog_sales.cs_wholesale_cost BETWEEN 15 AND 20 AND item.i_category = 'Shoes' AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100