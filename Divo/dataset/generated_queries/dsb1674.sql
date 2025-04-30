--dsb_templates_generated-649b352e-3ece-4d5e-bad8-d5d2b928a07b_7095e637-7f54-3641-adc3-74279efff6cd.sql
--{"gen": "combine", "time": 0.31975460052490234, "template": "generated-649b352e-3ece-4d5e-bad8-d5d2b928a07b", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_returns AS store_returns,
date_dim AS d1,
date_dim AS d2,
store AS store,
store_sales AS store_sales
WHERE (d2.d_moy = 12 AND d2.d_year = 1998 AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 order by customer.c_customer_id LIMIT 100