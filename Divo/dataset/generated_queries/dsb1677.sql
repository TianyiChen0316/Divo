--dsb_templates_generated-91b07be6-76dc-4534-b506-55091cc07fe6_48e44922-50c6-3fbf-9462-dd553f22ce7e.sql
--{"gen": "erase", "time": 0.29903125762939453, "template": "generated-91b07be6-76dc-4534-b506-55091cc07fe6", "dataset": "dsb_templates", "rows": 1}
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
WHERE (date_dim.d_year = 2001 AND d2.d_moy = 12 AND d2.d_year = 2001 AND customer.c_birth_month = 10 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100