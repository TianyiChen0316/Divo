--dsb_templates_generated-54aedb33-b1e3-44e9-98f2-a6e018c73747_449e0fa3-2bb0-3c0f-9dc5-5568b64aaca8.sql
--{"gen": "erase", "time": 3.8012237548828125, "template": "generated-54aedb33-b1e3-44e9-98f2-a6e018c73747", "dataset": "dsb_templates", "rows": 1}
SELECT max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit
FROM catalog_sales AS catalog_sales,
store_returns AS store_returns,
store_sales AS store_sales,
call_center AS call_center,
ship_mode AS ship_mode,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
item AS item,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (call_center.cc_class = 'small' AND ship_mode.sm_type = 'REGULAR' AND warehouse.w_gmt_offset = -5 AND customer.c_birth_month = 8 AND customer_address.ca_state = 'AR' AND item.i_category = 'Books' AND customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_marital_status = 'D' AND date_dim.d_year BETWEEN 1999 AND 1999 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 48 AND 67 AND s1.ss_list_price BETWEEN 265 AND 279 AND s2.ss_list_price BETWEEN 4 AND 18 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_ship_mode_sk = ship_mode.sm_ship_mode_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_ship_date_sk = store_sales.ss_sold_date_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = store_returns.sr_customer_sk AND s1.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND s1.ss_customer_sk = store_sales.ss_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 LIMIT 100