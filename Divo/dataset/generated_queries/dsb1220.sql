--dsb_templates_query018_076_489f8dca-11f6-3b34-99a9-1828303fae9a.sql
--{"gen": "combine", "time": 2.800825595855713, "template": "query018_076", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (customer.c_birth_month = 5 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND date_dim.d_year = 2001 AND store.s_state = 'VA' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 43 AND 57 AND s2.ss_list_price BETWEEN 43 AND 57 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk)
 group by rollup(customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county LIMIT 100