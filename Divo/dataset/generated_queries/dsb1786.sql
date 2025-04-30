--dsb_templates_generated-36ca887f-e7d2-47f3-975d-7fee4a042313_bcec6b4b-3715-3429-b0d9-29f998115cfa.sql
--{"gen": "combine", "time": 0.921414852142334, "template": "generated-36ca887f-e7d2-47f3-975d-7fee4a042313", "dataset": "dsb_templates", "rows": 1}
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
customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim
WHERE (store.s_state = 'ID' AND item.i_category = 'Shoes' AND catalog_sales.cs_wholesale_cost BETWEEN 30 AND 35 AND customer.c_birth_month = 4 AND customer_address.ca_state = 'IA' AND date_dim.d_moy = 2 AND date_dim.d_year = 1999 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND date_dim.d_date_sk = catalog_sales.cs_sold_date_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100