--dsb_templates_generated-f15e9c47-4dcd-4471-98b7-7a27ada71108_c0a16252-29c5-317d-8309-fe7e2dc8cf8a.sql
--{"gen": "erase", "time": 2.022660732269287, "template": "generated-f15e9c47-4dcd-4471-98b7-7a27ada71108", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
item AS item1,
store_sales AS s1,
store_sales AS s2,
date_dim AS d1
WHERE (date_dim.d_year = 2001 AND store.s_state = 'AK' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 246 AND 260 AND s2.ss_list_price BETWEEN 38 AND 52 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date_sk = s1.ss_sold_date_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100