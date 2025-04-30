--dsb_templates_generated-9d50adea-b4a0-44f9-aafa-86b5ad44bac1_9c71b839-d9a5-35e9-9804-86e699d3eb16.sql
--{"gen": "erase", "time": 1.1365413665771484, "template": "generated-9d50adea-b4a0-44f9-aafa-86b5ad44bac1", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
ship_mode AS ship_mode,
customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
store_sales AS store_sales,
web_sales AS web_sales
WHERE (ship_mode.sm_type = 'OVERNIGHT' AND customer.c_birth_month = 1 AND customer_address.ca_state = 'KS' AND d1.d_year = 2002 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk)
 LIMIT 100