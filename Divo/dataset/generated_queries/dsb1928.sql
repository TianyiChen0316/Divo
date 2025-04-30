--dsb_templates_generated-a59872fa-4f89-410e-a282-efb94bbd0fd4_5ad79075-edf0-30ff-be2d-a4b4489cf6fc.sql
--{"gen": "erase", "time": 0.4839644432067871, "template": "generated-a59872fa-4f89-410e-a282-efb94bbd0fd4", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM store AS store,
store_sales AS store_sales,
inventory AS inventory,
warehouse AS warehouse
WHERE (store.s_state = 'MS' AND store_sales.ss_store_sk = store.s_store_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100