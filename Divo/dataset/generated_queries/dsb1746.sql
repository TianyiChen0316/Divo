--dsb_templates_query019_088_eee6a3f4-0c2c-3b2f-81c2-1af3d43a8856.sql
--{"gen": "erase", "time": 1.473468542098999, "template": "query019_088", "dataset": "dsb_templates", "rows": 100}
SELECT item.i_brand AS brand,
item.i_brand_id AS brand_id,
item.i_manufact,
item.i_manufact_id,
sum(store_sales.ss_ext_sales_price) AS ext_price
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (item.i_category = 'Music' AND date_dim.d_year = 2002 AND date_dim.d_moy = 10 AND store_sales.ss_wholesale_cost BETWEEN 37 AND 57 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk)
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100