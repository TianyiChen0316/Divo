--dsb_templates_generated-6e5d714b-c8b5-4048-a5ea-842f7a68678d_a46c16c6-18f7-3568-bf3e-167ad9ab7cbd.sql
--{"gen": "erase", "time": 0.3542647361755371, "template": "generated-6e5d714b-c8b5-4048-a5ea-842f7a68678d", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item
WHERE (ship_mode.sm_type = 'OVERNIGHT' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 12 AND customer_address.ca_state = 'CA' AND item.i_category = 'Jewelry' AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk)
 LIMIT 100