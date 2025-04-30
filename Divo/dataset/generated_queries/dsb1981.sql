--dsb_templates_generated-1e2e3a35-9c12-4b59-aa06-ed289980e71a_f7a368f7-a152-3cef-b091-f81e1d25d947.sql
--{"gen": "combine", "time": 3.9890928268432617, "template": "generated-1e2e3a35-9c12-4b59-aa06-ed289980e71a", "dataset": "dsb_templates", "rows": 1}
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
customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
call_center AS call_center,
catalog_sales AS catalog_sales,
ship_mode AS ship_mode,
warehouse AS warehouse
WHERE (date_dim.d_year = 2000 AND item.i_category = 'Home' AND store.s_state = 'UT' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 45 AND 64 AND s1.ss_list_price BETWEEN 203 AND 217 AND s2.ss_list_price BETWEEN 165 AND 179 AND call_center.cc_class = 'small' AND catalog_sales.cs_list_price BETWEEN 181 AND 210 AND ship_mode.sm_type = 'LIBRARY' AND warehouse.w_gmt_offset = -5 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND catalog_sales.cs_ship_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100