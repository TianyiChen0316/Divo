--dsb_templates_query084_001_139dd271-2dde-3058-96fd-44a47f9765b9.sql
--{"gen": "erase", "time": 0.14435982704162598, "template": "query084_001", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band
WHERE (income_band.ib_lower_bound >= 18537 AND income_band.ib_upper_bound <= 22076 + 50000 AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk)
 order by customer.c_customer_id LIMIT 100