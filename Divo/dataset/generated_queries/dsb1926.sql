--dsb_templates_generated-b51b358b-ba66-4a21-a227-e0e63d4b72da_294d0bc7-e391-34c0-996a-405a5b48c0d5.sql
--{"gen": "erase", "time": 1.137974500656128, "template": "generated-b51b358b-ba66-4a21-a227-e0e63d4b72da", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d1,
store_returns AS store_returns,
catalog_sales AS catalog_sales
WHERE (customer_demographics.cd_education_status = '4 yr Degree' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'D' AND date_dim.d_year = 2001 AND item.i_category = 'Home' AND store.s_state = 'ND' AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100