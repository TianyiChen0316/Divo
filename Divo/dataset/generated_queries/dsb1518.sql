--dsb_templates_generated-25f9705c-7953-4dc7-a955-05b98883860a_13fd3bac-68dc-3ed5-8f69-b13e445115c6.sql
--{"gen": "erase", "time": 2.210768222808838, "template": "generated-25f9705c-7953-4dc7-a955-05b98883860a", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns,
store AS store,
store_sales AS store_sales
WHERE (income_band.ib_lower_bound >= 44081 AND income_band.ib_upper_bound <= 56635 + 50000 AND store_sales.ss_wholesale_cost BETWEEN 69 AND 89 AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100