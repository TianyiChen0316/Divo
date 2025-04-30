--dsb_templates_generated-3cb3180d-29de-4c91-9202-04e5d2ff3cdc_6502ad0e-6716-329f-bac2-29d898f5f629.sql
--{"gen": "combine", "time": 0.3128671646118164, "template": "generated-3cb3180d-29de-4c91-9202-04e5d2ff3cdc", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address
WHERE (customer_demographics.cd_education_status = 'Secondary' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'U' AND date_dim.d_year = 2001 AND item.i_category = 'Women' AND store.s_state = 'ID' AND d2.d_moy = 9 AND d2.d_year = 2002 AND customer.c_birth_month = 8 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100