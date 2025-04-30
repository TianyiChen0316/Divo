--dsb_templates_generated-0d65460a-9a4a-49e0-b662-a9a36caec17b_a7f9db83-ff4b-346a-b0e5-ffa0eeae3df7.sql
--{"gen": "erase", "time": 0.7625055313110352, "template": "generated-0d65460a-9a4a-49e0-b662-a9a36caec17b", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (income_band.ib_lower_bound >= 20390 AND income_band.ib_upper_bound <= 67683 + 50000 AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100