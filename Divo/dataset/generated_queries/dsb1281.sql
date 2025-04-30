--dsb_templates_generated-ef991b81-e07c-4343-98ab-a2d77f74fa45_e38c99f4-3a4c-32a0-8b3b-d5c1db26dba2.sql
--{"gen": "combine", "time": 0.27778029441833496, "template": "generated-ef991b81-e07c-4343-98ab-a2d77f74fa45", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM customer_demographics AS customer_demographics,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns
WHERE (customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = '4 yr Degree' AND store.s_state = 'WI' AND item.i_category = 'Music' AND d2.d_year = 2001 AND d2.d_moy = 3 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_returns.sr_item_sk = item.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100