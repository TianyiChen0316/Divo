--dsb_templates_query018_076_6f03bf46-6f0a-3b6d-adc2-ba2585f532a0.sql
--{"gen": "erase", "time": 1.078850269317627, "template": "query018_076", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM catalog_sales AS catalog_sales,
customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS date_dim
WHERE (customer_demographics.cd_gender = 'F' AND customer_demographics.cd_education_status = 'Unknown' AND date_dim.d_year = 2002 AND customer.c_birth_month = 2 AND catalog_sales.cs_wholesale_cost BETWEEN 59 AND 64 AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk)
 LIMIT 100