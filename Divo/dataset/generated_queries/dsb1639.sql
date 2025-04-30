--dsb_templates_generated-f9eea771-24bc-4d7f-a9ac-4c5ceaa57129_cd611cbe-22d4-3b54-a702-5b2c6d087c40.sql
--{"gen": "combine", "time": 0.6638538837432861, "template": "generated-f9eea771-24bc-4d7f-a9ac-4c5ceaa57129", "dataset": "dsb_templates", "rows": 6}
SELECT count(*) AS cnt,
household_demographics.hd_vehicle_count
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
date_dim AS d2,
household_demographics AS household_demographics,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales,
customer_demographics AS customer_demographics,
item AS item,
store AS store
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 1998 AND web_sales.ws_wholesale_cost BETWEEN 24 AND 44 AND item.i_category IN ('Electronics', 'Jewelry', 'Women') AND item.i_manager_id IN (3, 7, 8, 19, 28, 32, 42, 53, 55, 92) AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = inventory.inv_item_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 group by household_demographics.hd_vehicle_count order by cnt