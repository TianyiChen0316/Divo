--dsb_templates_generated-3a7a57ca-e65d-49e0-b56d-c852e110dbce_d7cf63a5-27c1-3cb9-a3e4-61d0a1a42bcc.sql
--{"gen": "combine", "time": 0.3760206699371338, "template": "generated-3a7a57ca-e65d-49e0-b56d-c852e110dbce", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item,
date_dim AS d1,
date_dim AS d2,
store AS store,
store_sales AS store_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim
WHERE (ship_mode.sm_type = 'REGULAR' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 5 AND customer_address.ca_state = 'MS' AND item.i_category = 'Electronics' AND d2.d_moy = 3 AND d2.d_year = 2000 AND customer_demographics.cd_education_status = '4 yr Degree' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'S' AND date_dim.d_year = 2002 AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 LIMIT 100