--dsb_templates_generated-1e2e3a35-9c12-4b59-aa06-ed289980e71a_1defd130-f60a-30aa-8a11-6c7f3f73909b.sql
--{"gen": "erase", "time": 4.753619194030762, "template": "generated-1e2e3a35-9c12-4b59-aa06-ed289980e71a", "dataset": "dsb_templates", "rows": 1}
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
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year = 2002 AND item.i_category = 'Sports' AND store.s_state = 'MN' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 136 AND 150 AND s2.ss_list_price BETWEEN 242 AND 256 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100