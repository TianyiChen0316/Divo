--dsb_templates_query019_088_1bf7a6d7-f9c5-3f4d-9dae-70b8b5ed025b.sql
--{"gen": "erase", "time": 1.5223474502563477, "template": "query019_088", "dataset": "dsb_templates", "rows": 1}
SELECT sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_state = 'SD' AND customer.c_birth_month = 1 AND store_sales.ss_wholesale_cost BETWEEN 7 AND 27 AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by ext_price desc LIMIT 100