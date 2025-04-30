--dsb_templates_query025_015_172c94b4-1b39-3ab4-b111-6670815032e3.sql
--{"gen": "erase", "time": 4.789746284484863, "template": "query025_015", "dataset": "dsb_templates", "rows": 2}
SELECT item.i_item_desc,
item.i_item_id,
max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
date_dim AS d1,
date_dim AS d3,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (d1.d_moy = 1 AND d1.d_year = 1998 AND d3.d_moy BETWEEN 5 AND 5 + 2 AND d3.d_year = 2002 AND d1.d_date_sk = store_sales.ss_sold_date_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 group by item.i_item_desc, item.i_item_id order by item.i_item_id, item.i_item_desc LIMIT 100