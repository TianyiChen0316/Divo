--dsb_templates_generated-ac2d4ca1-d5eb-464e-8625-a4ace9a7a6dc_363545e6-9f4c-339c-ad2f-151020b385c0.sql
--{"gen": "erase", "time": 0.418811559677124, "template": "generated-ac2d4ca1-d5eb-464e-8625-a4ace9a7a6dc", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
call_center AS call_center
WHERE (date_dim.d_year = 2001 AND store.s_state = 'FL' AND customer.c_birth_month = 12 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND call_center.cc_class = 'small' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100