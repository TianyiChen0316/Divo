--dsb_templates_generated-9534f3dc-e614-4e97-a380-54843a6a0670_c94cc640-4c6d-3951-a809-b5f6af1569e6.sql
--{"gen": "erase", "time": 4.197082042694092, "template": "generated-9534f3dc-e614-4e97-a380-54843a6a0670", "dataset": "dsb_templates", "rows": 1}
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
catalog_sales AS catalog_sales,
date_dim AS d3,
customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
date_dim AS d2,
web_sales AS web_sales
WHERE (date_dim.d_year = 2002 AND item.i_category = 'Jewelry' AND store.s_state = 'AK' AND d3.d_moy BETWEEN 9 AND 9 + 2 AND d3.d_year = 1999 AND customer.c_birth_month = 3 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND d1.d_year = 2002 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND web_sales.ws_item_sk = item.i_item_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100