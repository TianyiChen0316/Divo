--dsb_templates_generated-a4bab9a1-790a-4bc7-8a2b-a2905e406998_beb62eee-0262-350f-bb7a-028d0dfb43d8.sql
--{"gen": "erase", "time": 0.4408867359161377, "template": "generated-a4bab9a1-790a-4bc7-8a2b-a2905e406998", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
call_center AS call_center,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address
WHERE (call_center.cc_class = 'small' AND ship_mode.sm_type = 'OVERNIGHT' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 9 AND customer_address.ca_state = 'NE' AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk)
 LIMIT 100