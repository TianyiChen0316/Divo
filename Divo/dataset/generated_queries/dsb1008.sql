--dsb_templates_query019_088_d94a001b-d366-3383-9496-2c0cb86cd3d0.sql
--{"gen": "erase", "time": 1.381699562072754, "template": "query019_088", "dataset": "dsb_templates", "rows": 16}
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
WHERE (item.i_category = 'Children' AND date_dim.d_year = 1998 AND date_dim.d_moy = 4 AND customer.c_birth_month = 5 AND store_sales.ss_wholesale_cost BETWEEN 78 AND 98 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk)
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100