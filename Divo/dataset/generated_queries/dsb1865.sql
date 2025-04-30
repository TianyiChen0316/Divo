--dsb_templates_query050_013_f0b89b9e-5fe9-3fd9-8731-159ed1d45f94.sql
--{"gen": "combine", "time": 1.3631823062896729, "template": "query050_013", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
call_center AS call_center,
catalog_sales AS catalog_sales,
date_dim AS date_dim,
ship_mode AS ship_mode,
customer AS customer,
customer_address AS customer_address
WHERE (call_center.cc_class = 'medium' AND catalog_sales.cs_list_price BETWEEN 143 AND 172 AND date_dim.d_month_seq BETWEEN 1204 AND 1204 + 23 AND ship_mode.sm_type = 'TWO DAY' AND customer.c_birth_month = 2 AND customer_address.ca_state = 'KY' AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date_sk = catalog_sales.cs_ship_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk)
 LIMIT 100