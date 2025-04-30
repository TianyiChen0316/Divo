--dsb_templates_generated-5cf7c8e1-9d14-4b68-9298-e17765864f26_92288014-f398-3fba-9fa0-e8a3f23d685b.sql
--{"gen": "erase", "time": 2.5966265201568604, "template": "generated-5cf7c8e1-9d14-4b68-9298-e17765864f26", "dataset": "dsb_templates", "rows": 1}
SELECT ship_mode.sm_type,
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM catalog_sales AS catalog_sales,
ship_mode AS ship_mode,
date_dim AS d3,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (catalog_sales.cs_list_price BETWEEN 160 AND 189 AND ship_mode.sm_type = 'OVERNIGHT' AND d3.d_moy BETWEEN 7 AND 7 + 2 AND d3.d_year = 1999 AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 group by ship_mode.sm_type order by ship_mode.sm_type LIMIT 100