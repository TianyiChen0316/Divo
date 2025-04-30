--dsb_templates_query084_001_56da90fa-e167-39d1-bf0e-be640df933b0.sql
--{"gen": "combine", "time": 1.7658860683441162, "template": "query084_001", "dataset": "dsb_templates", "rows": 9}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Maple Grove' AND income_band.ib_lower_bound >= 17320 AND income_band.ib_upper_bound <= 61606 + 50000 AND date_dim.d_moy = 8 AND date_dim.d_year = 2002 AND item.i_category = 'Electronics' AND store_sales.ss_wholesale_cost BETWEEN 55 AND 75 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by customer.c_customer_id LIMIT 100