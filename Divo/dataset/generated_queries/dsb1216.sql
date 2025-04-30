--dsb_templates_generated-f5ba1e06-41c1-4b87-a007-68ff8ccafc92_01bedd7a-13c9-33dd-b0ad-09f2cdfbc819.sql
--{"gen": "erase", "time": 0.888911247253418, "template": "generated-f5ba1e06-41c1-4b87-a007-68ff8ccafc92", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM web_sales AS web_sales,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns
WHERE (web_sales.ws_wholesale_cost BETWEEN 73 AND 93 AND item.i_category = 'Children' AND store.s_state = 'SD' AND d2.d_moy = 12 AND d2.d_year = 1998 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND web_sales.ws_bill_customer_sk = store_sales.ss_customer_sk)
 order by cnt