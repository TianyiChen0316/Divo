--dsb_templates_generated-042678ee-d2ec-402c-8448-9e43e4d3e2c0_a960e440-e620-36a7-9a3f-7864a15676c2.sql
--{"gen": "combine", "time": 1.6845989227294922, "template": "generated-042678ee-d2ec-402c-8448-9e43e4d3e2c0", "dataset": "dsb_templates", "rows": 49}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
store_returns AS store_returns,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Spring Valley' AND date_dim.d_moy = 7 AND date_dim.d_year = 1999 AND item.i_category = 'Sports' AND store_sales.ss_wholesale_cost BETWEEN 13 AND 33 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by customer.c_customer_id LIMIT 100