--dsb_templates_generated-f5ba1e06-41c1-4b87-a007-68ff8ccafc92_2ba1d86c-93b2-3ddf-8452-116a49e82c3d.sql
--{"gen": "erase", "time": 0.2862372398376465, "template": "generated-f5ba1e06-41c1-4b87-a007-68ff8ccafc92", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns
WHERE (date_dim.d_year = 1999 AND item.i_category = 'Books' AND store.s_state = 'NV' AND d2.d_moy = 2 AND d2.d_year = 2001 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 order by cnt