--dsb_templates_generated-a4bab9a1-790a-4bc7-8a2b-a2905e406998_705404cd-2d24-32be-b011-5021664ecd1f.sql
--{"gen": "combine", "time": 1.790926218032837, "template": "generated-a4bab9a1-790a-4bc7-8a2b-a2905e406998", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d1,
household_demographics AS household_demographics,
income_band AS income_band,
date_dim AS date_dim
WHERE (d2.d_moy BETWEEN 2 AND 2 + 2 AND d2.d_year = 1999 AND call_center.cc_class = 'medium' AND ship_mode.sm_type = 'NEXT DAY' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 12 AND customer_address.ca_state = 'SD' AND item.i_category = 'Men' AND income_band.ib_lower_bound >= 3865 AND income_band.ib_upper_bound <= 18824 + 50000 AND date_dim.d_moy = 11 AND date_dim.d_year = 2001 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = catalog_sales.cs_ship_date_sk AND d1.d_date_sk = catalog_sales.cs_ship_date_sk)
 LIMIT 100