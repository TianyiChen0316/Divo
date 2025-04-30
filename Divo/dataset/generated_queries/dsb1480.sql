--dsb_templates_query018_076_c790a38e-5705-31b0-ad03-12f13acc2df0.sql
--{"gen": "erase", "time": 0.9242665767669678, "template": "query018_076", "dataset": "dsb_templates", "rows": 2}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
item.i_item_id
FROM catalog_sales AS catalog_sales,
customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item
WHERE (customer_demographics.cd_gender = 'F' AND customer_demographics.cd_education_status = 'Secondary' AND date_dim.d_year = 2001 AND customer.c_birth_month = 7 AND catalog_sales.cs_wholesale_cost BETWEEN 82 AND 87 AND item.i_category = 'Men' AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100