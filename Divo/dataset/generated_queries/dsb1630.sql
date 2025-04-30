--dsb_templates_generated-60407bef-f704-437b-9c20-d628c6e30c8a_6ad398f1-07ef-3d3f-8d66-9529d83ea0e3.sql
--{"gen": "combine", "time": 0.2709822654724121, "template": "generated-60407bef-f704-437b-9c20-d628c6e30c8a", "dataset": "dsb_templates", "rows": 1}
SELECT sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns
WHERE (customer_address.ca_state = 'OK' AND customer.c_birth_month = 10 AND store_sales.ss_wholesale_cost BETWEEN 74 AND 94 AND d2.d_moy = 12 AND d2.d_year = 1998 AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_customer_sk = store_returns.sr_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5) AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 order by ext_price desc LIMIT 100