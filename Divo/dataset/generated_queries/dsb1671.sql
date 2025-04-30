--dsb_templates_generated-0c943db1-271e-4331-bce7-d8125d5db0e5_27e9c9c1-d22e-30e0-a1bc-c6de34087776.sql
--{"gen": "combine", "time": 3.468972682952881, "template": "generated-0c943db1-271e-4331-bce7-d8125d5db0e5", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
call_center AS call_center,
catalog_sales AS catalog_sales,
ship_mode AS ship_mode,
warehouse AS warehouse
WHERE (date_dim.d_year = 1999 AND d2.d_moy = 5 AND d2.d_year = 2002 AND customer.c_birth_month = 6 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND call_center.cc_class = 'medium' AND catalog_sales.cs_list_price BETWEEN 19 AND 48 AND ship_mode.sm_type = 'NEXT DAY' AND warehouse.w_gmt_offset = -5 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 LIMIT 100