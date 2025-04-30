--dsb_templates_generated-d0e63e55-d514-47f8-8449-e8bc721fa85d_e1cdefeb-cab3-38b3-81ca-a9a72dfb70e7.sql
--{"gen": "combine", "time": 0.4844059944152832, "template": "generated-d0e63e55-d514-47f8-8449-e8bc721fa85d", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
date_dim AS d3,
ship_mode AS ship_mode
WHERE (customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'S' AND date_dim.d_year = 2001 AND item.i_category = 'Books' AND store.s_state = 'AK' AND d2.d_moy = 2 AND d2.d_year = 2001 AND catalog_sales.cs_wholesale_cost BETWEEN 85 AND 90 AND customer.c_birth_month = 2 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND d3.d_moy BETWEEN 8 AND 8 + 2 AND d3.d_year = 2000 AND ship_mode.sm_type = 'OVERNIGHT' AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND date_dim.d_date_sk = d3.d_date_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_cdemo_sk = store_sales.ss_cdemo_sk AND d3.d_date_sk = d1.d_date_sk AND d3.d_date_sk = store_sales.ss_sold_date_sk AND d1.d_date_sk = catalog_sales.cs_sold_date_sk AND store_sales.ss_sold_date_sk = catalog_sales.cs_sold_date_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100