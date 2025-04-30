--dsb_templates_generated-f15e9c47-4dcd-4471-98b7-7a27ada71108_adb39d9b-894c-3dc2-b4fc-4f96c00c598c.sql
--{"gen": "erase", "time": 3.8189122676849365, "template": "generated-f15e9c47-4dcd-4471-98b7-7a27ada71108", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
item AS item2,
store_sales AS s1,
store_sales AS s2,
date_dim AS d1
WHERE (date_dim.d_year = 2002 AND item2.i_manager_id BETWEEN 9 AND 28 AND s1.ss_list_price BETWEEN 236 AND 250 AND s2.ss_list_price BETWEEN 252 AND 266 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date_sk = s1.ss_sold_date_sk)
 LIMIT 100