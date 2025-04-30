--dsb_templates_generated-61ef94a6-d86c-4f8d-97c7-8e3e8608a7ab_d4390e32-f06b-38b7-898f-c57944c964b2.sql
--{"gen": "erase", "time": 0.4141383171081543, "template": "generated-61ef94a6-d86c-4f8d-97c7-8e3e8608a7ab", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
item.i_item_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (customer.c_birth_month = 7 AND customer_demographics.cd_education_status = 'Primary' AND customer_demographics.cd_gender = 'F' AND date_dim.d_year = 2002 AND item.i_category = 'Home' AND store.s_state = 'MN' AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100