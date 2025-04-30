--dsb_templates_generated-ef991b81-e07c-4343-98ab-a2d77f74fa45_e50fbc5f-02ac-314f-8915-6aa949c12832.sql
--{"gen": "erase", "time": 0.5794932842254639, "template": "generated-ef991b81-e07c-4343-98ab-a2d77f74fa45", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM item AS item,
store AS store,
store_sales AS store_sales
WHERE (store.s_state = 'ID' AND item.i_category = 'Jewelry' AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100