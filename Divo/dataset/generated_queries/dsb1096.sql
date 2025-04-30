--dsb_templates_query018_076_21cc936c-3232-341d-b139-3eec95c6f9f3.sql
--{"gen": "combine", "time": 1.687988519668579, "template": "query018_076", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM customer AS customer,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (customer.c_birth_month = 7 AND date_dim.d_year = 2001 AND store.s_state = 'NH' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 21 AND 40 AND s1.ss_list_price BETWEEN 176 AND 190 AND s2.ss_list_price BETWEEN 259 AND 273 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 LIMIT 100