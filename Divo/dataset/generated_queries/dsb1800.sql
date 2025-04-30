--dsb_templates_query027_036_9367ff59-a480-3cab-a95c-e5e4b4375fd7.sql
--{"gen": "combine", "time": 0.34148526191711426, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
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
catalog_sales AS catalog_sales,
date_dim AS d2,
date_dim AS d3,
store_returns AS store_returns
WHERE (customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'M' AND date_dim.d_year = 2002 AND item.i_category = 'Books' AND store.s_state = 'ND' AND d2.d_moy BETWEEN 4 AND 4 + 2 AND d2.d_year = 2002 AND d3.d_moy BETWEEN 5 AND 5 + 2 AND d3.d_year = 2001 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100