--dsb_templates_generated-f480771b-ad8a-43c3-87a9-750dacd8980e_070d6f43-8f2e-394c-84d1-1357c5c7cb20.sql
--{"gen": "combine", "time": 0.8937892913818359, "template": "generated-f480771b-ad8a-43c3-87a9-750dacd8980e", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (customer_demographics.cd_education_status = '4 yr Degree' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'M' AND date_dim.d_year = 1998 AND item.i_category = 'Women' AND store.s_state = 'IL' AND customer.c_birth_month = 4 AND customer_address.ca_state = 'ND' AND d1.d_year = 2002 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_sales.ss_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5) AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100