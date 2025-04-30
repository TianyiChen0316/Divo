--dsb_templates_generated-d6eaa6eb-251f-4c69-a0f9-c2b2c81e270c_dda7513e-27ac-36ff-970d-3bc051058da6.sql
--{"gen": "combine", "time": 0.9674925804138184, "template": "generated-d6eaa6eb-251f-4c69-a0f9-c2b2c81e270c", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
call_center AS call_center,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
date_dim AS d2,
store_sales AS store_sales,
web_sales AS web_sales
WHERE (call_center.cc_class = 'small' AND ship_mode.sm_type = 'REGULAR' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 3 AND customer_address.ca_state = 'OK' AND d1.d_year = 1998 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 LIMIT 100