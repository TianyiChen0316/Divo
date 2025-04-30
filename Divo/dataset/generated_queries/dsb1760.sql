--dsb_templates_generated-146262db-cfe1-4e7c-abd5-fbfea7cc31da_49205793-39da-3d7a-9794-97fb473bc43e.sql
--{"gen": "erase", "time": 0.8544173240661621, "template": "generated-146262db-cfe1-4e7c-abd5-fbfea7cc31da", "dataset": "dsb_templates", "rows": 3}
SELECT pg_catalog.substring(warehouse.w_warehouse_name, 1, 20),
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM catalog_sales AS catalog_sales,
date_dim AS date_dim,
warehouse AS warehouse
WHERE (date_dim.d_month_seq BETWEEN 1181 AND 1181 + 23 AND catalog_sales.cs_list_price BETWEEN 195 AND 224 AND warehouse.w_gmt_offset = -5 AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk)
 group by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20) order by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20) LIMIT 100