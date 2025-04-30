--dsb_templates_generated-ef991b81-e07c-4343-98ab-a2d77f74fa45_817006c6-ed1d-37e9-8e30-536ef365a6da.sql
--{"gen": "erase", "time": 1.0811951160430908, "template": "generated-ef991b81-e07c-4343-98ab-a2d77f74fa45", "dataset": "dsb_templates", "rows": 2}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM customer_demographics AS customer_demographics,
store AS store,
store_sales AS store_sales
WHERE (customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = 'College' AND store.s_state = 'MI' AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100