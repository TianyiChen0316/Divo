--dsb_templates_query101_069_c1fd3a62-b2fb-31f7-bce7-75fa2906f913.sql
--{"gen": "erase", "time": 4.920146703720093, "template": "query101_069", "dataset": "dsb_templates", "rows": 484}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND d1.d_year = 2000 AND household_demographics.hd_income_band_sk BETWEEN 9 AND 15 AND household_demographics.hd_buy_potential = '0-500' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt