--dsb_templates_query099_098_f0b89b9e-5fe9-3fd9-8731-159ed1d45f94.sql
--{"gen": "erase", "time": 0.8305439949035645, "template": "query099_098", "dataset": "dsb_templates", "rows": 3}
SELECT call_center.cc_name,
ship_mode.sm_type,
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM call_center AS call_center,
catalog_sales AS catalog_sales,
date_dim AS date_dim,
ship_mode AS ship_mode
WHERE (date_dim.d_month_seq BETWEEN 1202 AND 1202 + 23 AND catalog_sales.cs_list_price BETWEEN 239 AND 268 AND ship_mode.sm_type = 'OVERNIGHT' AND call_center.cc_class = 'medium' AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk)
 group by call_center.cc_name, ship_mode.sm_type order by ship_mode.sm_type, call_center.cc_name LIMIT 100