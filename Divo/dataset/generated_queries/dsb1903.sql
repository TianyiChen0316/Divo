--dsb_templates_query084_001_d5a32015-0c39-34e1-afbe-b1b7026bd856.sql
--{"gen": "erase", "time": 0.3673744201660156, "template": "query084_001", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (income_band.ib_lower_bound >= 35607 AND income_band.ib_upper_bound <= 36641 + 50000 AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100