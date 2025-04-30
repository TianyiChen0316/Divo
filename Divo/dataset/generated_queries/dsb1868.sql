--dsb_templates_generated-c37b821d-df09-4eb0-98ef-90f2006fa43c_a7f9db83-ff4b-346a-b0e5-ffa0eeae3df7.sql
--{"gen": "erase", "time": 0.3057231903076172, "template": "generated-c37b821d-df09-4eb0-98ef-90f2006fa43c", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
date_dim AS date_dim
WHERE (customer_address.ca_city = 'Plainview' AND date_dim.d_moy = 7 AND date_dim.d_year = 2002 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_current_addr_sk = customer_address.ca_address_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk)
 LIMIT 100