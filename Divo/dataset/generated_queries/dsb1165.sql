--dsb_templates_generated-19c8d3c5-f4d9-4325-abd4-3945bae7efc7_fc208c09-8b10-3e24-b109-78b776f6818d.sql
--{"gen": "combine", "time": 0.9480571746826172, "template": "generated-19c8d3c5-f4d9-4325-abd4-3945bae7efc7", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
web_sales AS web_sales,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns
WHERE (web_sales.ws_wholesale_cost BETWEEN 7 AND 27 AND date_dim.d_year = 2001 AND item.i_category = 'Sports' AND store.s_state = 'MT' AND d2.d_moy = 10 AND d2.d_year = 1999 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND web_sales.ws_bill_customer_sk = store_sales.ss_customer_sk)
 order by cnt