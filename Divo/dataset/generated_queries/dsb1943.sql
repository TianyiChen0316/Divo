--dsb_templates_generated-3c6ccdbf-8fc9-4517-9725-3d9549a601fd_ff5fb8e7-aa0d-39dc-818f-9f4c1bb9ed4d.sql
--{"gen": "combine", "time": 0.18875527381896973, "template": "generated-3c6ccdbf-8fc9-4517-9725-3d9549a601fd", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (date_dim.d_year = 1998 AND store.s_state = 'TX' AND d2.d_moy = 8 AND d2.d_year = 2000 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 28 AND 48 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND inventory.inv_date_sk = store_sales.ss_sold_date_sk AND inventory.inv_item_sk = store_sales.ss_item_sk AND store.s_state = warehouse.w_state AND store_sales.ss_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_item_sk = inventory.inv_item_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_date_sk = date_dim.d_date_sk AND inventory.inv_date_sk = d1.d_date_sk AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND web_sales.ws_bill_customer_sk = store_sales.ss_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND store_returns.sr_returned_date_sk = web_sales.ws_sold_date_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date AND inventory.inv_quantity_on_hand >= store_sales.ss_quantity)
 group by rollup(store.s_state) order by store.s_state LIMIT 100