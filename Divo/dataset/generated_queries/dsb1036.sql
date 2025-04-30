--dsb_templates_query084_001_41745c4f-02e0-36be-87ef-3237fbe916b7.sql
--{"gen": "combine", "time": 0.25536155700683594, "template": "query084_001", "dataset": "dsb_templates", "rows": 86}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (customer_address.ca_city = 'Mount Vernon' AND income_band.ib_lower_bound >= 19807 AND income_band.ib_upper_bound <= 1537 + 50000 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100