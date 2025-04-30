--dsb_templates_generated-343b9bfb-9772-42ca-ba95-6f2ef6c6b1de_30957741-4daf-3f6c-bc34-ddfd064a7656.sql
--{"gen": "erase", "time": 1.7485973834991455, "template": "generated-343b9bfb-9772-42ca-ba95-6f2ef6c6b1de", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM catalog_sales AS catalog_sales,
customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
item AS item,
store AS store
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 10 AND 15 AND customer.c_birth_month = 1 AND customer_demographics.cd_education_status = 'Secondary' AND customer_demographics.cd_gender = 'M' AND date_dim.d_year = 2000 AND d1.d_year = 2002 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND item.i_item_sk = store_sales.ss_item_sk AND store.s_store_sk = store_sales.ss_store_sk AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 LIMIT 100