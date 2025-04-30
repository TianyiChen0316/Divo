--dsb_templates_query027_036_dbb98bf9-eed4-3367-87fa-f4809077ed6a.sql
--{"gen": "combine", "time": 0.8985729217529297, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
customer AS customer,
item AS item1,
store_sales AS s1
WHERE (customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'D' AND date_dim.d_year = 2001 AND item.i_category = 'Men' AND store.s_state = 'WI' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 242 AND 256 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100