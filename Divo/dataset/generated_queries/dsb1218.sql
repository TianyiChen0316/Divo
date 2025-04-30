--dsb_templates_generated-e660b8f8-590f-4a79-be7e-d118e9c9aa3c_3fededf9-b4ab-3073-a1b5-b290cb133b83.sql
--{"gen": "erase", "time": 0.7592451572418213, "template": "generated-e660b8f8-590f-4a79-be7e-d118e9c9aa3c", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
customer AS customer,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year = 1998 AND store.s_state = 'MT' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 82 AND 96 AND s2.ss_list_price BETWEEN 122 AND 136 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100