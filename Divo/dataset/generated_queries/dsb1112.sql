--dsb_templates_generated-2c4b6268-c84c-4469-a16a-e974720e2bdc_f7eadb03-e488-3075-80e2-8141403d4f20.sql
--{"gen": "erase", "time": 0.4052238464355469, "template": "generated-2c4b6268-c84c-4469-a16a-e974720e2bdc", "dataset": "dsb_templates", "rows": 1}
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
customer_address AS customer_address
WHERE (date_dim.d_year = 2001 AND item.i_category = 'Sports' AND store.s_state = 'PA' AND d3.d_moy BETWEEN 4 AND 4 + 2 AND d3.d_year = 2002 AND customer.c_birth_month = 2 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100