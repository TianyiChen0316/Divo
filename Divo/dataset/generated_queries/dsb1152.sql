--dsb_templates_generated-0d65460a-9a4a-49e0-b662-a9a36caec17b_f4c2d5ca-ed60-3ad0-956e-1c14a8826be6.sql
--{"gen": "erase", "time": 0.1441650390625, "template": "generated-0d65460a-9a4a-49e0-b662-a9a36caec17b", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band
WHERE (income_band.ib_lower_bound >= 51086 AND income_band.ib_upper_bound <= 64792 + 50000 AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk)
 order by customer.c_customer_id LIMIT 100