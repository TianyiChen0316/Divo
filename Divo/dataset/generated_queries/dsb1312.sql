--dsb_templates_generated-a4bab9a1-790a-4bc7-8a2b-a2905e406998_172c94b4-1b39-3ab4-b111-6670815032e3.sql
--{"gen": "erase", "time": 0.3216428756713867, "template": "generated-a4bab9a1-790a-4bc7-8a2b-a2905e406998", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
store_sales AS store_sales,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item
WHERE (warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 6 AND customer_address.ca_state = 'MT' AND item.i_category = 'Women' AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk)
 LIMIT 100