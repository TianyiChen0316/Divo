--dsb_templates_query019_088_a1a44761-fd4f-31d9-a64c-f74d99b04ac3.sql
--{"gen": "erase", "time": 1.4477956295013428, "template": "query019_088", "dataset": "dsb_templates", "rows": 59}
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
WHERE (item.i_category = 'Jewelry' AND date_dim.d_year = 2001 AND date_dim.d_moy = 8 AND customer.c_birth_month = 11 AND store_sales.ss_wholesale_cost BETWEEN 16 AND 36 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk)
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100