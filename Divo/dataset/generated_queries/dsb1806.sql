--dsb_templates_generated-6515cac2-2329-419e-a676-0d35dc098059_2c7bced6-b1d0-3f74-8874-83a4ac8c9683.sql
--{"gen": "erase", "time": 0.2512514591217041, "template": "generated-6515cac2-2329-419e-a676-0d35dc098059", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
store_returns AS store_returns
WHERE (customer_address.ca_city = 'Providence' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100