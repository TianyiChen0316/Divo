--dsb_templates_generated-6e5d714b-c8b5-4048-a5ea-842f7a68678d_333082e7-d80a-3dd8-8889-0bd0b35fd160.sql
--{"gen": "erase", "time": 0.39646196365356445, "template": "generated-6e5d714b-c8b5-4048-a5ea-842f7a68678d", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
store_sales AS store_sales,
ship_mode AS ship_mode,
customer AS customer,
customer_address AS customer_address
WHERE (ship_mode.sm_type = 'TWO DAY' AND customer.c_birth_month = 7 AND customer_address.ca_state = 'MN' AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 LIMIT 100