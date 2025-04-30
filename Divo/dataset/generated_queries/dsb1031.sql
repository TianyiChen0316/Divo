--dsb_templates_query101_069_f970dcdf-028a-3f37-a7ea-4da061cfea1c.sql
--{"gen": "erase", "time": 1.5053322315216064, "template": "query101_069", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
date_dim AS d1,
date_dim AS d2,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND d1.d_year = 1998 AND household_demographics.hd_income_band_sk BETWEEN 10 AND 16 AND household_demographics.hd_buy_potential = '5001-10000' AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt