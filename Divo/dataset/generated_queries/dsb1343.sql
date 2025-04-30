--dsb_templates_generated-c0d58702-52a4-488d-a095-8d0fc09115d3_de76c886-196f-35bf-9a7a-f539b13152ce.sql
--{"gen": "combine", "time": 2.3629114627838135, "template": "generated-c0d58702-52a4-488d-a095-8d0fc09115d3", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
store_sales AS s1,
customer_address AS customer_address,
household_demographics AS household_demographics,
income_band AS income_band,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales
WHERE (s1.ss_list_price BETWEEN 275 AND 289 AND customer_address.ca_city = 'Providence' AND income_band.ib_lower_bound >= 6215 AND income_band.ib_upper_bound <= 7805 + 50000 AND date_dim.d_moy = 7 AND date_dim.d_year = 2002 AND store_sales.ss_wholesale_cost BETWEEN 7 AND 27 AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by cnt