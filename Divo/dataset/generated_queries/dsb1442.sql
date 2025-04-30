--dsb_templates_generated-27d00c6c-e3cd-4032-88c4-23005060d0d8_63e28158-8c30-3b3d-aa40-6371016878ac.sql
--{"gen": "combine", "time": 1.645334005355835, "template": "generated-27d00c6c-e3cd-4032-88c4-23005060d0d8", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d1,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
catalog_sales AS catalog_sales,
date_dim AS d2,
date_dim AS d3
WHERE (date_dim.d_year = 1998 AND item.i_category = 'Electronics' AND store.s_state = 'KS' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 64 AND 83 AND s1.ss_list_price BETWEEN 73 AND 87 AND s2.ss_list_price BETWEEN 258 AND 272 AND d2.d_moy BETWEEN 4 AND 4 + 2 AND d2.d_year = 2002 AND d3.d_moy BETWEEN 5 AND 5 + 2 AND d3.d_year = 2000 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100