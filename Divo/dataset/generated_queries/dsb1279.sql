--dsb_templates_generated-30a9a8d4-7ad8-4515-87e2-feaf990124ac_73e52acd-f3eb-39af-a255-e122523c029a.sql
--{"gen": "combine", "time": 0.2721545696258545, "template": "generated-30a9a8d4-7ad8-4515-87e2-feaf990124ac", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item,
household_demographics AS household_demographics,
store_sales AS store_sales
WHERE (ship_mode.sm_type = 'TWO DAY' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 4 AND customer_address.ca_state = 'MI' AND item.i_category = 'Men' AND household_demographics.hd_income_band_sk BETWEEN 7 AND 13 AND household_demographics.hd_buy_potential = '1001-5000' AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100