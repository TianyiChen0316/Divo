--dsb_templates_generated-28debb43-3b1c-4f3d-8a28-741a16956970_47fadf69-5fe4-31da-bf71-b4b2f104b85d.sql
--{"gen": "combine", "time": 1.7454519271850586, "template": "generated-28debb43-3b1c-4f3d-8a28-741a16956970", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM store AS store,
store_sales AS store_sales,
inventory AS inventory,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item
WHERE (store.s_state = 'MN' AND customer.c_birth_month = 11 AND customer_address.ca_state = 'NC' AND date_dim.d_moy = 7 AND date_dim.d_year = 1998 AND item.i_category = 'Music' AND store_sales.ss_store_sk = store.s_store_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by rollup(store.s_state) order by store.s_state LIMIT 100