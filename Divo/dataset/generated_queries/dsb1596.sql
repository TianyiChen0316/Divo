--dsb_templates_generated-8dde24d6-dcbb-4e50-8b3d-f5ab63789979_b417c952-4ab0-387d-a59b-61b6f2b37803.sql
--{"gen": "erase", "time": 0.42595982551574707, "template": "generated-8dde24d6-dcbb-4e50-8b3d-f5ab63789979", "dataset": "dsb_templates", "rows": 549}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d2,
household_demographics AS household_demographics,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND household_demographics.hd_income_band_sk BETWEEN 5 AND 11 AND household_demographics.hd_buy_potential = '0-500' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt