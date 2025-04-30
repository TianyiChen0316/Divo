--dsb_templates_query025_015_a932f6d1-4aaf-3e00-8ea6-f9a432eb1843.sql
--{"gen": "erase", "time": 3.445855140686035, "template": "query025_015", "dataset": "dsb_templates", "rows": 2}
SELECT item.i_item_desc,
item.i_item_id,
max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit,
store.s_store_id,
store.s_store_name
FROM catalog_sales AS catalog_sales,
date_dim AS d2,
date_dim AS d3,
item AS item,
store AS store,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (d2.d_moy BETWEEN 5 AND 5 + 2 AND d2.d_year = 2002 AND d3.d_moy BETWEEN 10 AND 10 + 2 AND d3.d_year = 1998 AND item.i_item_sk = store_sales.ss_item_sk AND store.s_store_sk = store_sales.ss_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 group by item.i_item_desc, item.i_item_id, store.s_store_id, store.s_store_name order by item.i_item_id, item.i_item_desc, store.s_store_id, store.s_store_name LIMIT 100