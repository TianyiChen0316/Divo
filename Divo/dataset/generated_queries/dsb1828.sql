--dsb_templates_generated-2af4bd76-7d4b-4bfa-bb76-ac2f4fde12c7_d7cf63a5-27c1-3cb9-a3e4-61d0a1a42bcc.sql
--{"gen": "erase", "time": 0.13719463348388672, "template": "generated-2af4bd76-7d4b-4bfa-bb76-ac2f4fde12c7", "dataset": "dsb_templates", "rows": 1}
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
store_returns AS store_returns,
catalog_sales AS catalog_sales,
date_dim AS d3,
customer AS customer,
customer_address AS customer_address,
call_center AS call_center,
ship_mode AS ship_mode,
warehouse AS warehouse
WHERE (date_dim.d_year = 2001 AND item.i_category = 'Home' AND store.s_state = 'ND' AND d3.d_moy BETWEEN 3 AND 3 + 2 AND d3.d_year = 2002 AND customer.c_birth_month = 5 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND call_center.cc_class = 'medium' AND ship_mode.sm_type = 'OVERNIGHT' AND warehouse.w_gmt_offset = -5 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100