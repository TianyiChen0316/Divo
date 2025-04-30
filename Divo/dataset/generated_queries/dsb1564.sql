--dsb_templates_generated-ad7f7e02-352c-46e5-9838-451d722456ae_f34f2270-9709-3a68-ae88-23e09757f17c.sql
--{"gen": "erase", "time": 0.9090380668640137, "template": "generated-ad7f7e02-352c-46e5-9838-451d722456ae", "dataset": "dsb_templates", "rows": 100}
SELECT item.i_item_desc,
item.i_item_id,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit,
store.s_store_id,
store.s_store_name
FROM date_dim AS d2,
item AS item,
store AS store,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (d2.d_moy BETWEEN 1 AND 1 + 2 AND d2.d_year = 2001 AND item.i_item_sk = store_sales.ss_item_sk AND store.s_store_sk = store_sales.ss_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_returns.sr_item_sk = item.i_item_sk)
 group by item.i_item_desc, item.i_item_id, store.s_store_id, store.s_store_name order by item.i_item_id, item.i_item_desc, store.s_store_id, store.s_store_name LIMIT 100