--dsb_templates_generated-f3c5286e-fa86-484d-83d3-e74a91cb5f00_003326e9-b39a-3deb-bbe2-9b436271fbd0.sql
--{"gen": "erase", "time": 1.3770861625671387, "template": "generated-f3c5286e-fa86-484d-83d3-e74a91cb5f00", "dataset": "dsb_templates", "rows": 61}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM item AS item,
store AS store,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
customer AS customer
WHERE (store.s_state = 'MI' AND item.i_category = 'Sports' AND catalog_sales.cs_wholesale_cost BETWEEN 87 AND 92 AND customer.c_birth_month = 10 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100