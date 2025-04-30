--dsb_templates_generated-643b1a44-5244-4fe9-8606-78cbf35742ea_36450eff-1162-35f3-af0f-e672d9dfb4e5.sql
--{"gen": "combine", "time": 2.978734016418457, "template": "generated-643b1a44-5244-4fe9-8606-78cbf35742ea", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
call_center AS call_center,
catalog_sales AS catalog_sales,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year = 1999 AND item.i_category = 'Children' AND store.s_state = 'KS' AND d2.d_moy = 3 AND d2.d_year = 2001 AND call_center.cc_class = 'medium' AND catalog_sales.cs_list_price BETWEEN 253 AND 282 AND ship_mode.sm_type = 'NEXT DAY' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 5 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 47 AND 66 AND s1.ss_list_price BETWEEN 136 AND 150 AND s2.ss_list_price BETWEEN 14 AND 28 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND d1.d_date_sk = catalog_sales.cs_ship_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND catalog_sales.cs_ship_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = store_returns.sr_customer_sk AND s1.ss_customer_sk = store_sales.ss_customer_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100