--dsb_templates_generated-96dc3c76-f1ee-442a-b461-8ff1e092ea95_a5c209cc-c805-3c60-b659-aead8987f1c2.sql
--{"gen": "erase", "time": 3.84873104095459, "template": "generated-96dc3c76-f1ee-442a-b461-8ff1e092ea95", "dataset": "dsb_templates", "rows": 1}
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
ship_mode AS ship_mode,
customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (call_center.cc_class = 'small' AND catalog_sales.cs_list_price BETWEEN 117 AND 146 AND date_dim.d_month_seq BETWEEN 1194 AND 1194 + 23 AND ship_mode.sm_type = 'NEXT DAY' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 78 AND 97 AND s1.ss_list_price BETWEEN 93 AND 107 AND s2.ss_list_price BETWEEN 243 AND 257 AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND catalog_sales.cs_ship_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by call_center.cc_name, ship_mode.sm_type order by ship_mode.sm_type, call_center.cc_name LIMIT 100