--dsb_templates_generated-6d2acdc5-81e6-4367-8bab-e8a628d1427e_c4baecee-e75a-3a4e-a530-1a7f2aad98c7.sql
--{"gen": "erase", "time": 0.8403091430664062, "template": "generated-6d2acdc5-81e6-4367-8bab-e8a628d1427e", "dataset": "dsb_templates", "rows": 1}
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
item AS item2,
store_sales AS s1,
store_sales AS s2,
date_dim AS d1,
store_returns AS store_returns
WHERE (date_dim.d_year = 2001 AND store.s_state = 'SD' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 57 AND 76 AND s1.ss_list_price BETWEEN 50 AND 64 AND s2.ss_list_price BETWEEN 99 AND 113 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100