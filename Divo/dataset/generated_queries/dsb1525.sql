--dsb_templates_query084_001_ff1a9e3f-ae13-38fb-9e1d-e02fa1950100.sql
--{"gen": "erase", "time": 0.2120349407196045, "template": "query084_001", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band
WHERE (income_band.ib_lower_bound >= 1537 AND income_band.ib_upper_bound <= 44081 + 50000 AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk)
 order by customer.c_customer_id LIMIT 100