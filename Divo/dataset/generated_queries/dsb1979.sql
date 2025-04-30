--dsb_templates_query099_098_96fbc745-e30e-3d29-9651-e23073111eef.sql
--{"gen": "erase", "time": 0.8347263336181641, "template": "query099_098", "dataset": "dsb_templates", "rows": 9}
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
ship_mode AS ship_mode,
warehouse AS warehouse
WHERE (catalog_sales.cs_list_price BETWEEN 270 AND 299 AND ship_mode.sm_type = 'NEXT DAY' AND call_center.cc_class = 'large' AND warehouse.w_gmt_offset = -5 AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk)
 group by call_center.cc_name, pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type order by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type, call_center.cc_name LIMIT 100