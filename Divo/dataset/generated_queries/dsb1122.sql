--dsb_templates_generated-3c6ccdbf-8fc9-4517-9725-3d9549a601fd_0a5543f8-6487-376d-ad30-ea750b661d5c.sql
--{"gen": "combine", "time": 1.7370831966400146, "template": "generated-3c6ccdbf-8fc9-4517-9725-3d9549a601fd", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year = 2000 AND item.i_category = 'Music' AND store.s_state = 'GA' AND d2.d_moy = 12 AND d2.d_year = 2002 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 6 AND 25 AND s1.ss_list_price BETWEEN 186 AND 200 AND s2.ss_list_price BETWEEN 205 AND 219 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100