--dsb_templates_generated-e053448e-1a45-4ee7-a575-435dd69e9d86_1bf7a6d7-f9c5-3f4d-9dae-70b8b5ed025b.sql
--{"gen": "combine", "time": 0.47956395149230957, "template": "generated-e053448e-1a45-4ee7-a575-435dd69e9d86", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
web_sales AS web_sales
WHERE (customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'W' AND date_dim.d_year = 2000 AND item.i_category = 'Home' AND store.s_state = 'MN' AND d2.d_year = 1998 AND d2.d_moy = 4 AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND d1.d_year = 1999 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_sales.ss_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND store_returns.sr_returned_date_sk = web_sales.ws_sold_date_sk AND d1.d_date_sk = d2.d_date_sk AND d1.d_date_sk = web_sales.ws_sold_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100