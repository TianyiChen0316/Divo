--dsb_templates_query018_076_742042ef-7c3c-3d83-b753-0a2a1c5ccb58.sql
--{"gen": "erase", "time": 0.9095263481140137, "template": "query018_076", "dataset": "dsb_templates", "rows": 19}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state
FROM catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics
WHERE (customer_demographics.cd_gender = 'M' AND customer_demographics.cd_education_status = 'Secondary' AND customer.c_birth_month = 9 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND catalog_sales.cs_wholesale_cost BETWEEN 87 AND 92 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 group by rollup(customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county LIMIT 100