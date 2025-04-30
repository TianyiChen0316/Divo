--dsb_templates_generated-146262db-cfe1-4e7c-abd5-fbfea7cc31da_24ec8ec8-adff-3c0f-89cb-db1e2ee31ba5.sql
--{"gen": "combine", "time": 2.4684009552001953, "template": "generated-146262db-cfe1-4e7c-abd5-fbfea7cc31da", "dataset": "dsb_templates", "rows": 9}
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
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (date_dim.d_month_seq BETWEEN 1198 AND 1198 + 23 AND catalog_sales.cs_list_price BETWEEN 240 AND 269 AND call_center.cc_class = 'medium' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 4 AND customer_address.ca_state = 'AK' AND item.i_category = 'Shoes' AND store_sales.ss_wholesale_cost BETWEEN 1 AND 21 AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by call_center.cc_name, pg_catalog.substring(warehouse.w_warehouse_name, 1, 20) order by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), call_center.cc_name LIMIT 100