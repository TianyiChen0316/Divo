--dsb_templates_generated-25f9705c-7953-4dc7-a955-05b98883860a_cf4234d6-8d9b-3dae-99bb-d4c5c755ad63.sql
--{"gen": "erase", "time": 1.733553171157837, "template": "generated-25f9705c-7953-4dc7-a955-05b98883860a", "dataset": "dsb_templates", "rows": 30}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Spring Valley' AND income_band.ib_lower_bound >= 32361 AND income_band.ib_upper_bound <= 30129 + 50000 AND date_dim.d_moy = 6 AND date_dim.d_year = 1998 AND store_sales.ss_wholesale_cost BETWEEN 56 AND 76 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by customer.c_customer_id LIMIT 100