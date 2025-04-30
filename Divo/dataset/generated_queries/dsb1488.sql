--dsb_templates_generated-6e5d714b-c8b5-4048-a5ea-842f7a68678d_fe7857b0-1e5f-3808-b07a-e0e0809aa44a.sql
--{"gen": "erase", "time": 0.9129784107208252, "template": "generated-6e5d714b-c8b5-4048-a5ea-842f7a68678d", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
call_center AS call_center,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer
WHERE (call_center.cc_class = 'small' AND ship_mode.sm_type = 'NEXT DAY' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 3 AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk)
 LIMIT 100