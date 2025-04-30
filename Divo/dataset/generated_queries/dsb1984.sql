--dsb_templates_generated-c41e0d70-a493-4fd5-ab77-6cd8eeb7d614_189b9ebc-5b37-3850-a671-9030b5a08126.sql
--{"gen": "erase", "time": 2.281996488571167, "template": "generated-c41e0d70-a493-4fd5-ab77-6cd8eeb7d614", "dataset": "dsb_templates", "rows": 2}
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
customer_address AS customer_address,
item AS item,
store_sales AS store_sales
WHERE (call_center.cc_class = 'medium' AND catalog_sales.cs_list_price BETWEEN 259 AND 288 AND date_dim.d_month_seq BETWEEN 1211 AND 1211 + 23 AND ship_mode.sm_type = 'EXPRESS' AND customer.c_birth_month = 8 AND customer_address.ca_state = 'VA' AND item.i_category = 'Jewelry' AND store_sales.ss_wholesale_cost BETWEEN 80 AND 100 AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 group by call_center.cc_name, ship_mode.sm_type order by ship_mode.sm_type, call_center.cc_name LIMIT 100