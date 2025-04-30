--dsb_templates_generated-146262db-cfe1-4e7c-abd5-fbfea7cc31da_41ef2277-fd93-3f21-9ff1-ae7a1dda86da.sql
--{"gen": "erase", "time": 0.9206602573394775, "template": "generated-146262db-cfe1-4e7c-abd5-fbfea7cc31da", "dataset": "dsb_templates", "rows": 3}
SELECT call_center.cc_name,
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM call_center AS call_center,
catalog_sales AS catalog_sales,
date_dim AS date_dim
WHERE (date_dim.d_month_seq BETWEEN 1182 AND 1182 + 23 AND catalog_sales.cs_list_price BETWEEN 132 AND 161 AND call_center.cc_class = 'medium' AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk)
 group by call_center.cc_name order by call_center.cc_name LIMIT 100