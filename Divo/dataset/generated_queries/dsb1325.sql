--dsb_templates_generated-1e3924bc-1515-44d5-b2ba-14fc32d0e2b3_3913e289-5f2b-36cc-b45f-0e82e66808d4.sql
--{"gen": "combine", "time": 0.2769291400909424, "template": "generated-1e3924bc-1515-44d5-b2ba-14fc32d0e2b3", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
customer_demographics AS customer_demographics,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns
WHERE (date_dim.d_year = 1998 AND store.s_state = 'NH' AND item.i_category = 'Women' AND customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'M' AND d2.d_moy = 6 AND d2.d_year = 1998 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100