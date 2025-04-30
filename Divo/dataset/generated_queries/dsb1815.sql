--dsb_templates_generated-1e2e3a35-9c12-4b59-aa06-ed289980e71a_ac15927a-1cd8-3113-951c-da01fb5a0436.sql
--{"gen": "combine", "time": 0.8275227546691895, "template": "generated-1e2e3a35-9c12-4b59-aa06-ed289980e71a", "dataset": "dsb_templates", "rows": 1}
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
catalog_sales AS catalog_sales,
date_dim AS d1,
date_dim AS d2,
date_dim AS d3,
store_returns AS store_returns
WHERE (date_dim.d_year = 2000 AND item.i_category = 'Shoes' AND store.s_state = 'AK' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 2 AND 21 AND s1.ss_list_price BETWEEN 135 AND 149 AND s2.ss_list_price BETWEEN 258 AND 272 AND d1.d_moy = 8 AND d1.d_year = 1998 AND d2.d_moy BETWEEN 5 AND 5 + 2 AND d2.d_year = 2001 AND d3.d_moy BETWEEN 10 AND 10 + 2 AND d3.d_year = 2002 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND d1.d_date_sk = store_sales.ss_sold_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100