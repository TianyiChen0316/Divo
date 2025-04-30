--dsb_templates_generated-ceb4a8e5-05a8-4cb1-8991-46571a8d2b31_8e53238b-ecbc-3de1-b717-e9f8ddd81d5c.sql
--{"gen": "erase", "time": 0.2877621650695801, "template": "generated-ceb4a8e5-05a8-4cb1-8991-46571a8d2b31", "dataset": "dsb_templates", "rows": 3}
SELECT store.s_city,
store.s_company_id,
store.s_county,
store.s_state,
store.s_store_name,
store.s_street_name,
store.s_street_number,
store.s_street_type,
store.s_suite_number,
store.s_zip,
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM store AS store,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim
WHERE (customer.c_birth_month = 5 AND customer_address.ca_state = 'NV' AND date_dim.d_moy = 10 AND date_dim.d_year = 1998 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by store.s_city, store.s_company_id, store.s_county, store.s_state, store.s_store_name, store.s_street_name, store.s_street_number, store.s_street_type, store.s_suite_number, store.s_zip order by store.s_store_name, store.s_company_id, store.s_street_number, store.s_street_name, store.s_street_type, store.s_suite_number, store.s_city, store.s_county, store.s_state, store.s_zip LIMIT 100