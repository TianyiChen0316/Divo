--dsb_templates_generated-cd5265e9-c876-4114-8088-0af3d34615cc_b51c597e-5c75-33d8-af2b-a89f4f41b5d7.sql
--{"gen": "erase", "time": 0.9042503833770752, "template": "generated-cd5265e9-c876-4114-8088-0af3d34615cc", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4
FROM catalog_sales AS catalog_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
date_dim AS d3,
store AS store
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 71 AND 76 AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'M' AND date_dim.d_year = 2000 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND d3.d_moy BETWEEN 1 AND 1 + 2 AND d3.d_year = 2001 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store.s_store_sk = store_sales.ss_store_sk AND date_dim.d_date_sk = d3.d_date_sk)
 LIMIT 100