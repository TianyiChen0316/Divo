--dsb_templates_generated-3c6ccdbf-8fc9-4517-9725-3d9549a601fd_ba6f31ce-30ab-3a4c-87f3-8e64a2574468.sql
--{"gen": "erase", "time": 1.0706796646118164, "template": "generated-3c6ccdbf-8fc9-4517-9725-3d9549a601fd", "dataset": "dsb_templates", "rows": 29}
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
store_returns AS store_returns
WHERE (customer_demographics.cd_education_status = '4 yr Degree' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'W' AND date_dim.d_year = 2002 AND item.i_category = 'Books' AND store.s_state = 'MN' AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100