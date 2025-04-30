--dsb_templates_generated-36d4bed3-6847-4fb7-a1b1-89ffdc72e75d_f3562182-503f-3a53-a725-2f3be07b051e.sql
--{"gen": "erase", "time": 0.41003966331481934, "template": "generated-36d4bed3-6847-4fb7-a1b1-89ffdc72e75d", "dataset": "dsb_templates", "rows": 100}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d2,
web_sales AS web_sales
WHERE (customer.c_birth_month = 12 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer.c_current_addr_sk = customer_address.ca_address_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk)
 group by rollup(customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county LIMIT 100