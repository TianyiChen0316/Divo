--dsb_templates_query084_001_3d413638-4e29-36f9-b824-0a1b887bfd34.sql
--{"gen": "combine", "time": 3.248824119567871, "template": "query084_001", "dataset": "dsb_templates", "rows": 1}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (customer_address.ca_city = 'Pleasant Valley' AND income_band.ib_lower_bound >= 18537 AND income_band.ib_upper_bound <= 233 + 50000 AND item2.i_manager_id BETWEEN 61 AND 80 AND s1.ss_list_price BETWEEN 38 AND 52 AND s2.ss_list_price BETWEEN 282 AND 296 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100