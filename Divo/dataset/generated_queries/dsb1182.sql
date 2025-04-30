--dsb_templates_generated-19adf05c-0b84-4186-b735-a6af3d6bf7e1_cf8b1e87-6b9f-32eb-ac00-43e76a819e96.sql
--{"gen": "erase", "time": 3.0807855129241943, "template": "generated-19adf05c-0b84-4186-b735-a6af3d6bf7e1", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_address AS customer_address,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales,
date_dim AS date_dim,
store_sales AS s1,
store_sales AS s2
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 78 AND 98 AND date_dim.d_year BETWEEN 1998 AND 1998 + 1 AND s1.ss_list_price BETWEEN 258 AND 272 AND s2.ss_list_price BETWEEN 81 AND 95 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk)
 order by cnt