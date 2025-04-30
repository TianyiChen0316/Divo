--dsb_templates_query019_088_3a7119bc-44e3-3a0f-a757-f63d8c1dddd8.sql
--{"gen": "erase", "time": 1.3398573398590088, "template": "query019_088", "dataset": "dsb_templates", "rows": 1}
SELECT sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
store_sales AS store_sales
WHERE (date_dim.d_year = 2001 AND date_dim.d_moy = 2 AND customer_address.ca_state = 'WV' AND customer.c_birth_month = 5 AND store_sales.ss_wholesale_cost BETWEEN 73 AND 93 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 order by ext_price desc LIMIT 100