--dsb_templates_generated-23b79a67-15d3-4256-9446-d5cc980693ac_722f499b-ed0e-3026-a707-47707eb508b8.sql
--{"gen": "erase", "time": 3.452878713607788, "template": "generated-23b79a67-15d3-4256-9446-d5cc980693ac", "dataset": "dsb_templates", "rows": 1}
SELECT ship_mode.sm_type,
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM catalog_sales AS catalog_sales,
date_dim AS date_dim,
ship_mode AS ship_mode,
date_dim AS d3,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (catalog_sales.cs_list_price BETWEEN 181 AND 210 AND date_dim.d_month_seq BETWEEN 1197 AND 1197 + 23 AND ship_mode.sm_type = 'EXPRESS' AND d3.d_moy BETWEEN 3 AND 3 + 2 AND d3.d_year = 2001 AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 group by ship_mode.sm_type order by ship_mode.sm_type LIMIT 100