--dsb_templates_generated-4ebbc621-fba8-4374-9478-a56a4f43a29f_b974951d-6200-3c74-8f0b-c1ced0c0b214.sql
--{"gen": "erase", "time": 1.030677080154419, "template": "generated-4ebbc621-fba8-4374-9478-a56a4f43a29f", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM customer AS customer,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (customer.c_birth_month = 1 AND date_dim.d_year = 2002 AND store.s_state = 'AR' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk)
 LIMIT 100