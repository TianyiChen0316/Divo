--dsb_templates_generated-c2e97c5f-82fe-4f32-b18d-c1fbaa16ba79_502e8d40-9b49-3761-8d37-a7adf957f85d.sql
--{"gen": "erase", "time": 4.2527875900268555, "template": "generated-c2e97c5f-82fe-4f32-b18d-c1fbaa16ba79", "dataset": "dsb_templates", "rows": 100}
SELECT item.i_item_desc,
item.i_item_id,
max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
date_dim AS d3,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (d3.d_moy BETWEEN 3 AND 3 + 2 AND d3.d_year = 2000 AND item.i_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 group by item.i_item_desc, item.i_item_id order by item.i_item_id, item.i_item_desc LIMIT 100