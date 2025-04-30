--dsb_templates_generated-8b52366e-4290-44bd-b615-30394ec57715_c63ac29b-370d-337c-8751-c6a718d75302.sql
--{"gen": "combine", "time": 1.0625991821289062, "template": "generated-8b52366e-4290-44bd-b615-30394ec57715", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_returns AS store_returns,
inventory AS inventory,
item AS item,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales,
customer_address AS customer_address,
date_dim AS d1,
date_dim AS d2,
household_demographics AS household_demographics
WHERE (item.i_category IN ('Electronics', 'Jewelry', 'Women') AND item.i_manager_id IN (3, 7, 8, 19, 28, 32, 42, 53, 55, 92) AND web_sales.ws_wholesale_cost BETWEEN 53 AND 73 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 2001 AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = inventory.inv_item_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND d1.d_date_sk = inventory.inv_date_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 order by customer.c_customer_id LIMIT 100