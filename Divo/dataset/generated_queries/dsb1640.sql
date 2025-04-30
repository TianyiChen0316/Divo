--dsb_templates_query084_001_05dd8aba-7b43-3438-848c-738cec6febdb.sql
--{"gen": "erase", "time": 0.27030086517333984, "template": "query084_001", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
store_returns AS store_returns
WHERE (customer_address.ca_city = 'White Oak' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100