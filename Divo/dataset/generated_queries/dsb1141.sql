--dsb_templates_query019_088_bd9af2ba-f38e-321f-9f7e-454a759b317a.sql
--{"gen": "combine", "time": 1.4241700172424316, "template": "query019_088", "dataset": "dsb_templates", "rows": 1}
SELECT item.i_brand AS brand,
item.i_brand_id AS brand_id,
item.i_manufact,
item.i_manufact_id,
sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer.c_birth_month = 7 AND customer_address.ca_state = 'CO' AND date_dim.d_moy = 5 AND date_dim.d_year = 2000 AND item.i_category = 'Books' AND store_sales.ss_wholesale_cost BETWEEN 48 AND 68 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100