--dsb_templates_generated-00bd4c72-6eab-4d6e-bef5-862e304f7947_24ec8ec8-adff-3c0f-89cb-db1e2ee31ba5.sql
--{"gen": "combine", "time": 2.407334804534912, "template": "generated-00bd4c72-6eab-4d6e-bef5-862e304f7947", "dataset": "dsb_templates", "rows": 1}
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
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
date_dim AS d1,
store_returns AS store_returns,
customer_demographics AS customer_demographics,
customer_address AS customer_address
WHERE (date_dim.d_year = 1998 AND item.i_category = 'Music' AND store.s_state = 'NH' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 70 AND 89 AND s1.ss_list_price BETWEEN 196 AND 210 AND s2.ss_list_price BETWEEN 69 AND 83 AND customer_demographics.cd_marital_status = 'D' AND customer_demographics.cd_education_status = 'Primary' AND customer_address.ca_state = 'CO' AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND item1.i_item_sk < item2.i_item_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100