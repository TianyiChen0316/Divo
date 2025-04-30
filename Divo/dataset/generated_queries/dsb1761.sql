--dsb_templates_generated-48f6a21b-fa18-45a3-a3cb-603df4f3b3ed_a52ca55e-b81a-3f95-9cb6-db9050fd7804.sql
--{"gen": "erase", "time": 3.8354029655456543, "template": "generated-48f6a21b-fa18-45a3-a3cb-603df4f3b3ed", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4
FROM catalog_sales AS catalog_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 68 AND 73 AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'M' AND date_dim.d_year = 2002 AND d1.d_year = 2001 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100