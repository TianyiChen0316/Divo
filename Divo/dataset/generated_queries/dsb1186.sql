--dsb_templates_generated-a4bab9a1-790a-4bc7-8a2b-a2905e406998_f50d210c-d467-3b4c-a208-d47cadcf5343.sql
--{"gen": "combine", "time": 0.7215461730957031, "template": "generated-a4bab9a1-790a-4bc7-8a2b-a2905e406998", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
call_center AS call_center,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item,
date_dim AS date_dim,
store AS store
WHERE (d2.d_moy BETWEEN 10 AND 10 + 2 AND d2.d_year = 1999 AND call_center.cc_class = 'medium' AND ship_mode.sm_type = 'OVERNIGHT' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 2 AND customer_address.ca_state = 'WV' AND item.i_category = 'Jewelry' AND date_dim.d_month_seq BETWEEN 1198 AND 1198 + 23 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 LIMIT 100