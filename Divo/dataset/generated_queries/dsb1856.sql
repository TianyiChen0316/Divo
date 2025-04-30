--dsb_templates_generated-90994f61-4527-4c45-99e3-34c99bbb3732_6e199c54-c170-3be2-b483-e3daff6d529c.sql
--{"gen": "combine", "time": 4.829501628875732, "template": "generated-90994f61-4527-4c45-99e3-34c99bbb3732", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM item AS item,
store AS store,
store_sales AS store_sales,
store_returns AS store_returns,
date_dim AS date_dim,
date_dim AS d1,
call_center AS call_center,
catalog_sales AS catalog_sales,
warehouse AS warehouse,
customer AS customer
WHERE (store.s_state = 'SD' AND item.i_category = 'Shoes' AND date_dim.d_year = 2002 AND call_center.cc_class = 'large' AND catalog_sales.cs_list_price BETWEEN 270 AND 299 AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 7 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND d1.d_date_sk = catalog_sales.cs_ship_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100