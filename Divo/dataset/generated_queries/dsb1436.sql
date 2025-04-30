--dsb_templates_query027_036_438377c1-7550-39eb-824f-3dfa385b0c00.sql
--{"gen": "erase", "time": 1.1515870094299316, "template": "query027_036", "dataset": "dsb_templates", "rows": 2}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales
WHERE (customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = 'Advanced Degree' AND date_dim.d_year = 2000 AND store.s_state = 'MN' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100