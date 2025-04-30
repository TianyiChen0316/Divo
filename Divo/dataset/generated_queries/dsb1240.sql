--dsb_templates_generated-a5d9a27a-1c60-4d52-90e7-77235dc201f9_712572b1-6032-3dab-862f-ef82b9f3e8a0.sql
--{"gen": "erase", "time": 1.4562032222747803, "template": "generated-a5d9a27a-1c60-4d52-90e7-77235dc201f9", "dataset": "dsb_templates", "rows": 1}
SELECT sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_state = 'SC' AND customer.c_birth_month = 11 AND store_sales.ss_wholesale_cost BETWEEN 65 AND 85 AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by ext_price desc LIMIT 100