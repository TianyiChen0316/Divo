--dsb_templates_query019_088_0981a27d-6457-35c5-959d-2c80b4e75326.sql
--{"gen": "erase", "time": 1.1116557121276855, "template": "query019_088", "dataset": "dsb_templates", "rows": 1}
SELECT sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_state = 'FL' AND customer.c_birth_month = 2 AND store_sales.ss_wholesale_cost BETWEEN 20 AND 40 AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by ext_price desc LIMIT 100