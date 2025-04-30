--dsb_templates_query027_036_4abe4057-2bde-35f3-b778-9af96c70d895.sql
--{"gen": "combine", "time": 3.9236557483673096, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
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
store_sales AS s2
WHERE (date_dim.d_year = 2000 AND item.i_category = 'Men' AND store.s_state = 'KS' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 48 AND 67 AND s1.ss_list_price BETWEEN 201 AND 215 AND s2.ss_list_price BETWEEN 222 AND 236 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100