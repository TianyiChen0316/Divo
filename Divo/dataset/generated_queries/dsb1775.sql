--dsb_templates_generated-b9eeda9a-c970-45b0-bd56-23161126e5c8_fdbc1471-e616-361a-a76c-c487770ee641.sql
--{"gen": "combine", "time": 0.7679691314697266, "template": "generated-b9eeda9a-c970-45b0-bd56-23161126e5c8", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
customer_demographics AS customer_demographics,
store_returns AS store_returns,
web_sales AS web_sales,
date_dim AS d1,
date_dim AS d2,
date_dim AS d3
WHERE (date_dim.d_year = 1999 AND store.s_state = 'MN' AND item.i_category = 'Men' AND catalog_sales.cs_wholesale_cost BETWEEN 58 AND 63 AND customer_demographics.cd_education_status = 'College' AND customer_demographics.cd_gender = 'M' AND d1.d_moy = 7 AND d1.d_year = 2002 AND d2.d_moy BETWEEN 1 AND 1 + 2 AND d2.d_year = 2001 AND d3.d_moy BETWEEN 9 AND 9 + 2 AND d3.d_year = 2000 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND d1.d_date_sk = store_sales.ss_sold_date_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND date_dim.d_date_sk = d3.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND d3.d_date_sk = d1.d_date_sk AND d3.d_date_sk = store_sales.ss_sold_date_sk AND d1.d_date_sk = catalog_sales.cs_sold_date_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100