--dsb_templates_generated-5a498ecc-db56-4174-9d02-69e6d02f76bc_eee6a3f4-0c2c-3b2f-81c2-1af3d43a8856.sql
--{"gen": "erase", "time": 0.6370189189910889, "template": "generated-5a498ecc-db56-4174-9d02-69e6d02f76bc", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
customer AS customer,
date_dim AS d1,
inventory AS inventory,
warehouse AS warehouse
WHERE (date_dim.d_year = 1999 AND store.s_state = 'ID' AND d1.d_year = 2000 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND d1.d_date_sk = inventory.inv_date_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100