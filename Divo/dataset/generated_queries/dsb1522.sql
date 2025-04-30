--dsb_templates_generated-bc997ed6-ebb6-463f-89e6-f98d6385f3e9_37e8cbbf-3100-3bf2-8e36-f7a6c4f0777a.sql
--{"gen": "combine", "time": 0.6207785606384277, "template": "generated-bc997ed6-ebb6-463f-89e6-f98d6385f3e9", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
store_sales AS store_sales,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item,
date_dim AS date_dim,
store AS store,
date_dim AS d1,
date_dim AS d2
WHERE (warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 7 AND customer_address.ca_state = 'AK' AND item.i_category = 'Electronics' AND date_dim.d_year = 2002 AND store.s_state = 'MS' AND d2.d_moy = 12 AND d2.d_year = 2000 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = catalog_sales.cs_ship_date_sk AND d1.d_date_sk = catalog_sales.cs_ship_date_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 LIMIT 100