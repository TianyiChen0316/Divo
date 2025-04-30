--dsb_templates_generated-653eb56e-b0a0-4c37-a634-dd9d369bbbb1_0a8d1f19-eb18-3e83-b7f3-fedc13e19b6e.sql
--{"gen": "erase", "time": 0.42102742195129395, "template": "generated-653eb56e-b0a0-4c37-a634-dd9d369bbbb1", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
call_center AS call_center,
warehouse AS warehouse
WHERE (date_dim.d_year = 2001 AND customer.c_birth_month = 7 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND call_center.cc_class = 'small' AND warehouse.w_gmt_offset = -5 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk)
 LIMIT 100