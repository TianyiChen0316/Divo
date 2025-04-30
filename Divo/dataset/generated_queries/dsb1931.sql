--dsb_templates_query019_088_4f62664f-7afd-3722-bd63-7300756624fe.sql
--{"gen": "erase", "time": 1.4636635780334473, "template": "query019_088", "dataset": "dsb_templates", "rows": 72}
SELECT item.i_brand AS brand,
item.i_brand_id AS brand_id,
item.i_manufact,
item.i_manufact_id,
sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
date_dim AS date_dim,
item AS item,
store_sales AS store_sales
WHERE (item.i_category = 'Books' AND date_dim.d_year = 2000 AND date_dim.d_moy = 9 AND customer.c_birth_month = 6 AND store_sales.ss_wholesale_cost BETWEEN 55 AND 75 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk)
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100