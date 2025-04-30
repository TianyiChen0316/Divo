--dsb_templates_generated-ad38f6ec-978b-4f5d-b9c9-7708746e1d9c_53c5c288-2728-3749-b850-8e6093be8b39.sql
--{"gen": "erase", "time": 0.44402456283569336, "template": "generated-ad38f6ec-978b-4f5d-b9c9-7708746e1d9c", "dataset": "dsb_templates", "rows": 100}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d2,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (customer.c_birth_month = 6 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk)
 group by rollup(customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county LIMIT 100