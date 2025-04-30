--dsb_templates_generated-0662c834-f1bf-4d29-a92b-bca93bd63476_11f72c6f-62f4-3d6b-a385-db3476baa494.sql
--{"gen": "erase", "time": 1.0676934719085693, "template": "generated-0662c834-f1bf-4d29-a92b-bca93bd63476", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4
FROM catalog_sales AS catalog_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
store_returns AS store_returns,
date_dim AS d2,
web_sales AS web_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 87 AND 92 AND customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_gender = 'F' AND date_dim.d_year = 2000 AND store.s_state = 'KY' AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_cdemo_sk = store_sales.ss_cdemo_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk)
 LIMIT 100