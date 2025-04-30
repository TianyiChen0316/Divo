--dsb_templates_query027_036_f5fbcd43-00ef-30d9-a25f-d4b586d36a0a.sql
--{"gen": "combine", "time": 0.20826411247253418, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
call_center AS call_center,
catalog_sales AS catalog_sales,
ship_mode AS ship_mode,
warehouse AS warehouse
WHERE (customer_demographics.cd_education_status = 'Secondary' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'U' AND date_dim.d_year = 1999 AND item.i_category = 'Jewelry' AND store.s_state = 'WV' AND call_center.cc_class = 'medium' AND catalog_sales.cs_list_price BETWEEN 9 AND 38 AND ship_mode.sm_type = 'REGULAR' AND warehouse.w_gmt_offset = -5 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100