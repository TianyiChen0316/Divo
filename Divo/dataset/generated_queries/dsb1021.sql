--dsb_templates_query099_098_3b399c65-7538-3e07-9ec9-90c6245f63b7.sql
--{"gen": "erase", "time": 0.8467142581939697, "template": "query099_098", "dataset": "dsb_templates", "rows": 9}
SELECT call_center.cc_name,
pg_catalog.substring(warehouse.w_warehouse_name, 1, 20),
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM call_center AS call_center,
catalog_sales AS catalog_sales,
date_dim AS date_dim,
warehouse AS warehouse
WHERE (date_dim.d_month_seq BETWEEN 1194 AND 1194 + 23 AND catalog_sales.cs_list_price BETWEEN 259 AND 288 AND call_center.cc_class = 'medium' AND warehouse.w_gmt_offset = -5 AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk)
 group by call_center.cc_name, pg_catalog.substring(warehouse.w_warehouse_name, 1, 20) order by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), call_center.cc_name LIMIT 100