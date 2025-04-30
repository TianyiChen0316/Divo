--dsb_templates_query027_036_600bb541-f122-3039-81e3-fd636f733e3d.sql
--{"gen": "combine", "time": 1.070939302444458, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address
WHERE (customer_demographics.cd_education_status = 'College' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'D' AND date_dim.d_year = 2001 AND item.i_category = 'Sports' AND store.s_state = 'PA' AND customer.c_birth_month = 2 AND customer_address.ca_state = 'AL' AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100