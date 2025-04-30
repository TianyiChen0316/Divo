--dsb_templates_query027_036_6ccdec93-5ca8-3635-92e9-2caae7467cae.sql
--{"gen": "erase", "time": 0.10568809509277344, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM customer_demographics AS customer_demographics,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'M' AND customer_demographics.cd_education_status = '2 yr Degree' AND store.s_state = 'VA' AND item.i_category = 'Sports' AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100