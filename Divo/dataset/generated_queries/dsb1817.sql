--dsb_templates_generated-3f9da75d-a69c-47c4-a176-1c13f5e028a6_a83b7716-3213-3162-8938-77b4469b5e62.sql
--{"gen": "erase", "time": 0.7010464668273926, "template": "generated-3f9da75d-a69c-47c4-a176-1c13f5e028a6", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
customer AS customer,
item AS item1,
store_sales AS s1
WHERE (date_dim.d_year = 1999 AND store.s_state = 'SD' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 55 AND 69 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100