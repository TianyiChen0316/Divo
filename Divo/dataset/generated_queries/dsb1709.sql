--dsb_templates_query084_001_da96789a-4d29-3740-a231-b47cb95bb041.sql
--{"gen": "combine", "time": 0.31853699684143066, "template": "query084_001", "dataset": "dsb_templates", "rows": 1}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns,
date_dim AS d1,
date_dim AS d2,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Pleasant Valley' AND income_band.ib_lower_bound >= 16358 AND income_band.ib_upper_bound <= 46105 + 50000 AND d2.d_moy = 4 AND d2.d_year = 1999 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 order by customer.c_customer_id LIMIT 100