--dsb_templates_generated-3120fa5c-196f-4462-97d3-da672ee967d4_b54f6216-46af-37ea-bb1f-aab5b8f89716.sql
--{"gen": "erase", "time": 0.7892935276031494, "template": "generated-3120fa5c-196f-4462-97d3-da672ee967d4", "dataset": "dsb_templates", "rows": 1}
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
customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (date_dim.d_year = 2001 AND item.i_category = 'Children' AND store.s_state = 'MN' AND customer.c_birth_month = 1 AND customer_address.ca_state = 'SC' AND d1.d_year = 2002 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100