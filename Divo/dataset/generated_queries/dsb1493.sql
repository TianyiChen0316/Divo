--dsb_templates_generated-25f9705c-7953-4dc7-a955-05b98883860a_2828a7f3-247c-3fa8-aacc-0aa03eb238a3.sql
--{"gen": "erase", "time": 1.6090824604034424, "template": "generated-25f9705c-7953-4dc7-a955-05b98883860a", "dataset": "dsb_templates", "rows": 1}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
store_returns AS store_returns,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Cedar Grove' AND date_dim.d_moy = 3 AND date_dim.d_year = 1998 AND item.i_category = 'Home' AND store_sales.ss_wholesale_cost BETWEEN 56 AND 76 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by customer.c_customer_id LIMIT 100