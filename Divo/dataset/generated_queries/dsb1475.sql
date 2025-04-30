--dsb_templates_query101_069_ff1a9e3f-ae13-38fb-9e1d-e02fa1950100.sql
--{"gen": "erase", "time": 1.7936763763427734, "template": "query101_069", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
date_dim AS d1,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND d1.d_year = 1999 AND household_demographics.hd_income_band_sk BETWEEN 8 AND 14 AND household_demographics.hd_buy_potential = 'Unknown' AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt