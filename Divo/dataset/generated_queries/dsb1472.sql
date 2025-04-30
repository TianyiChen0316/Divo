--dsb_templates_generated-377bf419-9e78-4b6d-bc98-a408d51d14cd_37e8cbbf-3100-3bf2-8e36-f7a6c4f0777a.sql
--{"gen": "erase", "time": 1.2111015319824219, "template": "generated-377bf419-9e78-4b6d-bc98-a408d51d14cd", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4
FROM catalog_sales AS catalog_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 88 AND 93 AND customer_demographics.cd_education_status = '4 yr Degree' AND customer_demographics.cd_gender = 'F' AND date_dim.d_year = 2000 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100