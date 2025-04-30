--dsb_templates_generated-6d3e132a-15b2-42fb-88e2-05263b4b23df_d6ab1307-3d30-39b3-86a2-27b19317d94e.sql
--{"gen": "erase", "time": 0.547809362411499, "template": "generated-6d3e132a-15b2-42fb-88e2-05263b4b23df", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM store AS store,
store_sales AS store_sales,
customer AS customer,
inventory AS inventory,
warehouse AS warehouse
WHERE (store.s_state = 'UT' AND store_sales.ss_store_sk = store.s_store_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100