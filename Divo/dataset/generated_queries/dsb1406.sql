--dsb_templates_generated-653eb56e-b0a0-4c37-a634-dd9d369bbbb1_722f499b-ed0e-3026-a707-47707eb508b8.sql
--{"gen": "erase", "time": 0.4195232391357422, "template": "generated-653eb56e-b0a0-4c37-a634-dd9d369bbbb1", "dataset": "dsb_templates", "rows": 1}
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
store_returns AS store_returns,
catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
call_center AS call_center,
ship_mode AS ship_mode
WHERE (date_dim.d_year = 2002 AND item.i_category = 'Sports' AND store.s_state = 'MO' AND customer.c_birth_month = 10 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND call_center.cc_class = 'small' AND ship_mode.sm_type = 'REGULAR' AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100