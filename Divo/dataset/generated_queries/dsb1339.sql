--dsb_templates_query027_036_0bb77119-10a6-338b-af3b-c5ffa3226c26.sql
--{"gen": "combine", "time": 0.32987213134765625, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
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
store_returns AS store_returns
WHERE (customer_demographics.cd_education_status = 'Secondary' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'U' AND date_dim.d_year = 2002 AND item.i_category = 'Electronics' AND store.s_state = 'AK' AND d2.d_year = 2002 AND d2.d_moy = 11 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_returns.sr_item_sk = item.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100