--dsb_templates_generated-d940a1da-c00c-4c1b-8615-96924ff233f2_4b26656a-4c1e-3956-ae2b-e4eec342a722.sql
--{"gen": "erase", "time": 0.3775196075439453, "template": "generated-d940a1da-c00c-4c1b-8615-96924ff233f2", "dataset": "dsb_templates", "rows": 1}
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
web_sales AS web_sales
WHERE (customer_demographics.cd_education_status = '4 yr Degree' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'W' AND date_dim.d_year = 2002 AND item.i_category = 'Home' AND store.s_state = 'UT' AND d2.d_moy = 12 AND d2.d_year = 2000 AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_sales.ss_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND store_returns.sr_returned_date_sk = web_sales.ws_sold_date_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100