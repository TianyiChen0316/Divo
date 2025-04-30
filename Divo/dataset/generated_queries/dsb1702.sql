--dsb_templates_generated-61ef94a6-d86c-4f8d-97c7-8e3e8608a7ab_4e0302fa-323a-363d-8073-e071fad0bb73.sql
--{"gen": "erase", "time": 0.3832583427429199, "template": "generated-61ef94a6-d86c-4f8d-97c7-8e3e8608a7ab", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state,
item.i_item_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
store_returns AS store_returns,
date_dim AS d2,
web_sales AS web_sales
WHERE (customer.c_birth_month = 8 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_gender = 'F' AND date_dim.d_year = 1999 AND item.i_category = 'Men' AND store.s_state = 'KS' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100