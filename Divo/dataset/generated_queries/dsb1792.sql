--dsb_templates_generated-ef991b81-e07c-4343-98ab-a2d77f74fa45_3cbf4602-0049-3b11-82e2-74abf0bb2e97.sql
--{"gen": "combine", "time": 4.647132873535156, "template": "generated-ef991b81-e07c-4343-98ab-a2d77f74fa45", "dataset": "dsb_templates", "rows": 100}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM item AS item,
store_sales AS store_sales,
call_center AS call_center,
catalog_sales AS catalog_sales,
date_dim AS date_dim,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer
WHERE (item.i_category = 'Sports' AND call_center.cc_class = 'large' AND catalog_sales.cs_list_price BETWEEN 53 AND 82 AND date_dim.d_month_seq BETWEEN 1178 AND 1178 + 23 AND ship_mode.sm_type = 'TWO DAY' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 10 AND store_sales.ss_item_sk = item.i_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100