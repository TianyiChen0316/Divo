--dsb_templates_generated-8b6f7ff1-3008-431f-8433-d8e0e20f02bf_8e53238b-ecbc-3de1-b717-e9f8ddd81d5c.sql
--{"gen": "combine", "time": 0.36101627349853516, "template": "generated-8b6f7ff1-3008-431f-8433-d8e0e20f02bf", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
store_sales AS store_sales,
call_center AS call_center,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics
WHERE (call_center.cc_class = 'large' AND ship_mode.sm_type = 'LIBRARY' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 7 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 LIMIT 100