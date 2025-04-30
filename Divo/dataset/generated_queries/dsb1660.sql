--dsb_templates_generated-45c29bd7-fc35-4ae1-a186-2ce0a859f5ad_0691ea02-42e5-3bb4-ac2b-d47340df4664.sql
--{"gen": "erase", "time": 0.3463919162750244, "template": "generated-45c29bd7-fc35-4ae1-a186-2ce0a859f5ad", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address
WHERE (date_dim.d_year = 2002 AND store.s_state = 'IL' AND d2.d_moy = 12 AND d2.d_year = 2000 AND customer.c_birth_month = 8 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by rollup(store.s_state) order by store.s_state LIMIT 100