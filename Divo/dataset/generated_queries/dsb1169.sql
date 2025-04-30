--dsb_templates_generated-40db5dbb-fbe0-4a75-8111-58d168db4cc3_9a1ed08a-c9e1-3a3c-8565-b28580707738.sql
--{"gen": "erase", "time": 2.888838291168213, "template": "generated-40db5dbb-fbe0-4a75-8111-58d168db4cc3", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
date_dim AS d3,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (d3.d_moy BETWEEN 4 AND 4 + 2 AND d3.d_year = 1999 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 LIMIT 100