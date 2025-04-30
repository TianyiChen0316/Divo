--dsb_templates_query101_069_cc687f5d-1ffb-3086-8b6e-8812fbc661cb.sql
--{"gen": "erase", "time": 1.8143634796142578, "template": "query101_069", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM date_dim AS d1,
date_dim AS d2,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND d1.d_year = 1999 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 order by cnt