--dsb_templates_generated-9ce219f9-16a2-475e-9a9c-620bed22fd8e_db1ead96-bfb4-3585-9dbf-b29d15b745ee.sql
--{"gen": "erase", "time": 0.432619571685791, "template": "generated-9ce219f9-16a2-475e-9a9c-620bed22fd8e", "dataset": "dsb_templates", "rows": 846}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND household_demographics.hd_income_band_sk BETWEEN 1 AND 7 AND household_demographics.hd_buy_potential = '501-1000' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt