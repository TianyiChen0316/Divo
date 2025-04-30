--dsb_templates_generated-aba52b31-9172-48ac-99e2-6b7a4b435f90_061287d3-dbd3-32d0-bbe3-24a016f6d31f.sql
--{"gen": "combine", "time": 0.35309863090515137, "template": "generated-aba52b31-9172-48ac-99e2-6b7a4b435f90", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM store_returns AS store_returns,
store_sales AS store_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
customer AS customer
WHERE (customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'D' AND date_dim.d_year = 2001 AND item.i_category = 'Women' AND store.s_state = 'KS' AND customer.c_birth_month = 6 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100