--dsb_templates_query099_098_fe7857b0-1e5f-3808-b07a-e0e0809aa44a.sql
--{"gen": "combine", "time": 3.555745840072632, "template": "query099_098", "dataset": "dsb_templates", "rows": 3}
SELECT call_center.cc_name,
pg_catalog.substring(warehouse.w_warehouse_name, 1, 20),
ship_mode.sm_type,
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM call_center AS call_center,
catalog_sales AS catalog_sales,
date_dim AS date_dim,
ship_mode AS ship_mode,
warehouse AS warehouse,
item AS item,
store AS store,
store_sales AS store_sales,
store_returns AS store_returns
WHERE (call_center.cc_class = 'small' AND catalog_sales.cs_list_price BETWEEN 181 AND 210 AND date_dim.d_month_seq BETWEEN 1210 AND 1210 + 23 AND ship_mode.sm_type = 'TWO DAY' AND warehouse.w_gmt_offset = -5 AND item.i_category = 'Electronics' AND store.s_state = 'KS' AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 group by call_center.cc_name, pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type order by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type, call_center.cc_name LIMIT 100