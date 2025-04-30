--dsb_templates_generated-2f497f8f-c42b-49b4-b436-6f6bbd93c124_286d06fb-c49d-39a5-98cf-d051b7102f3a.sql
--{"gen": "erase", "time": 1.2148933410644531, "template": "generated-2f497f8f-c42b-49b4-b436-6f6bbd93c124", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM catalog_sales AS catalog_sales,
customer AS customer,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
store AS store,
household_demographics AS household_demographics
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 41 AND 46 AND customer.c_birth_month = 10 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND household_demographics.hd_income_band_sk BETWEEN 8 AND 14 AND household_demographics.hd_buy_potential = '1001-5000' AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND store.s_store_sk = store_sales.ss_store_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk)
 LIMIT 100