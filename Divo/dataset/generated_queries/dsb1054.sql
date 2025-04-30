--dsb_templates_query025_015_c5cdcf4e-eb02-35b1-bf98-987b9872892c.sql
--{"gen": "erase", "time": 2.3497748374938965, "template": "query025_015", "dataset": "dsb_templates", "rows": 4}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit,
store.s_store_id,
store.s_store_name
FROM catalog_sales AS catalog_sales,
date_dim AS d2,
date_dim AS d3,
store AS store,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (d2.d_moy BETWEEN 2 AND 2 + 2 AND d2.d_year = 1998 AND d3.d_moy BETWEEN 8 AND 8 + 2 AND d3.d_year = 1998 AND store.s_store_sk = store_sales.ss_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 group by store.s_store_id, store.s_store_name order by store.s_store_id, store.s_store_name LIMIT 100