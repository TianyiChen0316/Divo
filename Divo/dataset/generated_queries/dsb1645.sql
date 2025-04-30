--dsb_templates_query027_036_935ff3c1-c112-376c-9303-d872c9067948.sql
--{"gen": "erase", "time": 3.078038454055786, "template": "query027_036", "dataset": "dsb_templates", "rows": 100}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store_sales AS store_sales
WHERE (customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = 'Primary' AND date_dim.d_year = 1998 AND item.i_category = 'Shoes' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100