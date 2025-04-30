--dsb_templates_generated-8dde24d6-dcbb-4e50-8b3d-f5ab63789979_1a2ab175-7bc5-3b32-a043-5ab4500b6e93.sql
--{"gen": "combine", "time": 3.7008426189422607, "template": "generated-8dde24d6-dcbb-4e50-8b3d-f5ab63789979", "dataset": "dsb_templates", "rows": 478}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d2,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales,
date_dim AS d1
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND household_demographics.hd_income_band_sk BETWEEN 10 AND 16 AND household_demographics.hd_buy_potential = '0-500' AND d1.d_year = 1998 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt