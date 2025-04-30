--dsb_templates_generated-380d7af6-5447-4e61-bd10-87834862b918_90866a69-8987-3587-8da2-a3786607a534.sql
--{"gen": "combine", "time": 1.101165771484375, "template": "generated-380d7af6-5447-4e61-bd10-87834862b918", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item
WHERE (date_dim.d_year = 2000 AND store.s_state = 'IA' AND d2.d_moy = 6 AND d2.d_year = 2002 AND catalog_sales.cs_list_price BETWEEN 255 AND 284 AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 7 AND customer_address.ca_state = 'MT' AND item.i_category = 'Electronics' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND d1.d_date_sk = catalog_sales.cs_ship_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by rollup(store.s_state) order by store.s_state LIMIT 100