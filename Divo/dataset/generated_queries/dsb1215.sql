--dsb_templates_query019_088_fc208c09-8b10-3e24-b109-78b776f6818d.sql
--{"gen": "erase", "time": 1.4475162029266357, "template": "query019_088", "dataset": "dsb_templates", "rows": 52}
SELECT item.i_brand AS brand,
item.i_brand_id AS brand_id,
item.i_manufact,
item.i_manufact_id,
sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (item.i_category = 'Men' AND date_dim.d_year = 2001 AND date_dim.d_moy = 9 AND customer.c_birth_month = 12 AND store_sales.ss_wholesale_cost BETWEEN 55 AND 75 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk)
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100