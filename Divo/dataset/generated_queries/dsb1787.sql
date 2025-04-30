--dsb_templates_generated-3c6ccdbf-8fc9-4517-9725-3d9549a601fd_482921b9-9b4a-3fec-a944-348d036f9a7b.sql
--{"gen": "combine", "time": 1.5253684520721436, "template": "generated-3c6ccdbf-8fc9-4517-9725-3d9549a601fd", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
store_returns AS store_returns,
customer AS customer,
household_demographics AS household_demographics,
income_band AS income_band,
customer_address AS customer_address,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (date_dim.d_year = 1998 AND item.i_category = 'Sports' AND store.s_state = 'TN' AND income_band.ib_lower_bound >= 10939 AND income_band.ib_upper_bound <= 48188 + 50000 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 54 AND 74 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = inventory.inv_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND inventory.inv_item_sk = web_sales.ws_item_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_item_sk = inventory.inv_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND inventory.inv_item_sk = store_sales.ss_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100