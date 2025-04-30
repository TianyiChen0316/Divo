--dsb_templates_generated-1e3924bc-1515-44d5-b2ba-14fc32d0e2b3_5b77bdae-2402-3505-ac7e-6916912a6b56.sql
--{"gen": "erase", "time": 0.23946905136108398, "template": "generated-1e3924bc-1515-44d5-b2ba-14fc32d0e2b3", "dataset": "dsb_templates", "rows": 100}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM date_dim AS date_dim,
item AS item,
store_sales AS store_sales
WHERE (date_dim.d_year = 2001 AND item.i_category = 'Women' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = item.i_item_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100