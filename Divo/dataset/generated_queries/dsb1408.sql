--dsb_templates_query027_036_cf6b0f92-d578-3066-a729-67f01bed96a8.sql
--{"gen": "combine", "time": 1.211970329284668, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
ship_mode AS ship_mode,
warehouse AS warehouse,
store_returns AS store_returns
WHERE (customer_demographics.cd_education_status = 'Secondary' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'M' AND date_dim.d_year = 1998 AND item.i_category = 'Home' AND store.s_state = 'AR' AND catalog_sales.cs_list_price BETWEEN 144 AND 173 AND ship_mode.sm_type = 'OVERNIGHT' AND warehouse.w_gmt_offset = -5 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100