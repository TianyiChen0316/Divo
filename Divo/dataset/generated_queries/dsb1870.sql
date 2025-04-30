--dsb_templates_generated-a9f724e4-c857-4dd4-b931-e41b88dfe93b_7e6b2b6c-3805-3746-8c26-9a7158347f6e.sql
--{"gen": "combine", "time": 3.8709185123443604, "template": "generated-a9f724e4-c857-4dd4-b931-e41b88dfe93b", "dataset": "dsb_templates", "rows": 3}
SELECT call_center.cc_name,
pg_catalog.substring(warehouse.w_warehouse_name, 1, 20),
ship_mode.sm_type,
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM call_center AS call_center,
catalog_sales AS catalog_sales,
date_dim AS date_dim,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item,
store AS store,
store_sales AS store_sales,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (call_center.cc_class = 'small' AND catalog_sales.cs_list_price BETWEEN 124 AND 153 AND date_dim.d_month_seq BETWEEN 1200 AND 1200 + 23 AND ship_mode.sm_type = 'EXPRESS' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 9 AND customer_address.ca_state = 'IA' AND item.i_category = 'Men' AND store_sales.ss_wholesale_cost BETWEEN 7 AND 27 AND income_band.ib_lower_bound >= 1537 AND income_band.ib_upper_bound <= 10125 + 50000 AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by call_center.cc_name, pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type order by pg_catalog.substring(warehouse.w_warehouse_name, 1, 20), ship_mode.sm_type, call_center.cc_name LIMIT 100