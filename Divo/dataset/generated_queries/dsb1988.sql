--dsb_templates_query019_088_922f4029-f2c2-33b7-863c-03e055bf1833.sql
--{"gen": "erase", "time": 1.4675683975219727, "template": "query019_088", "dataset": "dsb_templates", "rows": 100}
SELECT item.i_brand AS brand,
item.i_brand_id AS brand_id,
item.i_manufact,
item.i_manufact_id,
sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
date_dim AS date_dim,
item AS item,
store_sales AS store_sales
WHERE (item.i_category = 'Electronics' AND date_dim.d_year = 1998 AND date_dim.d_moy = 2 AND customer.c_birth_month = 4 AND store_sales.ss_wholesale_cost BETWEEN 13 AND 33 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk)
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100