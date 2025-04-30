--dsb_templates_query099_098_70764b5d-3235-35bc-b874-67b8993fc80e.sql
--{"gen": "combine", "time": 3.801114559173584, "template": "query099_098", "dataset": "dsb_templates", "rows": 3}
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
warehouse AS warehouse,
customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (catalog_sales.cs_list_price BETWEEN 94 AND 123 AND date_dim.d_month_seq BETWEEN 1183 AND 1183 + 23 AND ship_mode.sm_type = 'REGULAR' AND warehouse.w_gmt_offset = -5 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 35 AND 54 AND s1.ss_list_price BETWEEN 169 AND 183 AND s2.ss_list_price BETWEEN 120 AND 134 AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND catalog_sales.cs_ship_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type order by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type LIMIT 100