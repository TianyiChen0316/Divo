--dsb_templates_generated-fcd2fede-04cd-430f-965f-edd9757234ea_338953bb-6a87-31ed-ba32-8deaf995d9a7.sql
--{"gen": "erase", "time": 0.2860729694366455, "template": "generated-fcd2fede-04cd-430f-965f-edd9757234ea", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address
WHERE (date_dim.d_year = 2000 AND d2.d_moy = 3 AND d2.d_year = 2000 AND customer.c_birth_month = 2 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100