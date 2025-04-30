--dsb_templates_generated-1e3924bc-1515-44d5-b2ba-14fc32d0e2b3_20619f55-49d5-39b4-9d49-0d1fb8471220.sql
--{"gen": "combine", "time": 2.0407488346099854, "template": "generated-1e3924bc-1515-44d5-b2ba-14fc32d0e2b3", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
call_center AS call_center,
catalog_sales AS catalog_sales,
ship_mode AS ship_mode,
warehouse AS warehouse
WHERE (date_dim.d_year = 2000 AND store.s_state = 'MT' AND item.i_category = 'Shoes' AND call_center.cc_class = 'large' AND catalog_sales.cs_list_price BETWEEN 155 AND 184 AND ship_mode.sm_type = 'OVERNIGHT' AND warehouse.w_gmt_offset = -5 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100