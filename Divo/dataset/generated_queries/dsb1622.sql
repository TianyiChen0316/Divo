--dsb_templates_query018_076_ed7a8be8-8e20-39f3-bb76-1151f065cf35.sql
--{"gen": "erase", "time": 0.9667158126831055, "template": "query018_076", "dataset": "dsb_templates", "rows": 9}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state,
item.i_item_id
FROM catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
item AS item
WHERE (customer_demographics.cd_gender = 'F' AND customer_demographics.cd_education_status = 'College' AND customer.c_birth_month = 5 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND catalog_sales.cs_wholesale_cost BETWEEN 33 AND 38 AND item.i_category = 'Children' AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100