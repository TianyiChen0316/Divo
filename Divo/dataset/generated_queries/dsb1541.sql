--dsb_templates_generated-7d9ab706-c083-41ec-befe-9f13dd147073_1be01ac4-967d-3bd7-a3bf-aaef02b3b637.sql
--{"gen": "erase", "time": 1.336059331893921, "template": "generated-7d9ab706-c083-41ec-befe-9f13dd147073", "dataset": "dsb_templates", "rows": 100}
SELECT item.i_brand AS brand,
item.i_brand_id AS brand_id,
item.i_manufact,
item.i_manufact_id,
sum(store_sales.ss_ext_sales_price) AS ext_price
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (item.i_category = 'Children' AND date_dim.d_year = 1998 AND date_dim.d_moy = 3 AND store_sales.ss_wholesale_cost BETWEEN 75 AND 95 AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk)
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100