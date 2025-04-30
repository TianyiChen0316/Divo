--dsb_templates_generated-d6eaa6eb-251f-4c69-a0f9-c2b2c81e270c_34baaa22-4ad0-3b3d-8d4d-0f838403570a.sql
--{"gen": "erase", "time": 1.5619444847106934, "template": "generated-d6eaa6eb-251f-4c69-a0f9-c2b2c81e270c", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
call_center AS call_center,
ship_mode AS ship_mode,
customer AS customer
WHERE (call_center.cc_class = 'small' AND ship_mode.sm_type = 'OVERNIGHT' AND customer.c_birth_month = 8 AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk)
 LIMIT 100