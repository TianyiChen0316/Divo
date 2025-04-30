--dsb_templates_generated-ba182d9f-658a-4217-83e7-85c0f8f165dd_40e6d355-0adc-38d3-b8a4-f1cb0c66b5ce.sql
--{"gen": "erase", "time": 1.1895678043365479, "template": "generated-ba182d9f-658a-4217-83e7-85c0f8f165dd", "dataset": "dsb_templates", "rows": 1}
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
item AS item,
store_returns AS store_returns
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 25 AND 30 AND customer.c_birth_month = 2 AND customer_demographics.cd_education_status = 'Secondary' AND customer_demographics.cd_gender = 'M' AND date_dim.d_year = 1998 AND item.i_category = 'Music' AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100