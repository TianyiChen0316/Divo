--dsb_templates_query027_036_f7897d54-7c4b-3d8d-b4a0-6434a3945c95.sql
--{"gen": "combine", "time": 0.6510190963745117, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
SELECT grouping(store.s_state) AS g_state,
store.s_state
FROM date_dim AS date_dim,
store AS store,
customer AS customer,
customer_address AS customer_address,
date_dim AS d2,
household_demographics AS household_demographics,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (date_dim.d_year = 2002 AND store.s_state = 'NH' AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 74 AND 94 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store.s_state = warehouse.w_state AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_item_sk = web_sales.ws_item_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_date_sk = date_dim.d_date_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100