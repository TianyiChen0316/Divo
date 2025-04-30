--dsb_templates_query099_098_d6ab1307-3d30-39b3-86a2-27b19317d94e.sql
--{"gen": "erase", "time": 1.036388635635376, "template": "query099_098", "dataset": "dsb_templates", "rows": 3}
SELECT pg_catalog.substring(warehouse.w_warehouse_name, 1, 20),
ship_mode.sm_type,
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM catalog_sales AS catalog_sales,
date_dim AS date_dim,
ship_mode AS ship_mode,
warehouse AS warehouse
WHERE (date_dim.d_month_seq BETWEEN 1188 AND 1188 + 23 AND catalog_sales.cs_list_price BETWEEN 14 AND 43 AND ship_mode.sm_type = 'LIBRARY' AND warehouse.w_gmt_offset = -5 AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk)
 group by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type order by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type LIMIT 100