--dsb_templates_query019_088_cd4c9464-2b20-3091-8499-46e2c9475163.sql
--{"gen": "erase", "time": 1.4849340915679932, "template": "query019_088", "dataset": "dsb_templates", "rows": 1}
SELECT sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales
WHERE (date_dim.d_year = 1998 AND date_dim.d_moy = 5 AND customer_address.ca_state = 'KS' AND customer.c_birth_month = 12 AND store_sales.ss_wholesale_cost BETWEEN 29 AND 49 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by ext_price desc LIMIT 100