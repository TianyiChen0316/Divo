--dsb_templates_query101_069_7253384b-1dbf-3e19-83f4-1656dcf52d9b.sql
--{"gen": "erase", "time": 0.45946693420410156, "template": "query101_069", "dataset": "dsb_templates", "rows": 910}
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
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND household_demographics.hd_income_band_sk BETWEEN 7 AND 13 AND household_demographics.hd_buy_potential = '>10000' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt