--dsb_templates_query018_076_6df96199-8996-3b35-b3c9-ccf8292a463a.sql
--{"gen": "combine", "time": 1.0331201553344727, "template": "query018_076", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 17 AND 22 AND customer.c_birth_month = 3 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = 'Primary' AND customer_demographics.cd_gender = 'F' AND date_dim.d_year = 1998 AND item.i_category = 'Jewelry' AND store_sales.ss_wholesale_cost BETWEEN 78 AND 98 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100