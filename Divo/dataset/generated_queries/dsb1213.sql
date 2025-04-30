--dsb_templates_generated-429c1d1d-2456-4f71-99fe-d45846f45d4e_40adf5e9-2385-3d2c-a13f-bdedd1f44428.sql
--{"gen": "erase", "time": 2.4597229957580566, "template": "generated-429c1d1d-2456-4f71-99fe-d45846f45d4e", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM catalog_sales AS catalog_sales,
customer AS customer,
date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
household_demographics AS household_demographics
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 23 AND 28 AND customer.c_birth_month = 10 AND d1.d_year = 2001 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND household_demographics.hd_income_band_sk BETWEEN 10 AND 16 AND household_demographics.hd_buy_potential = '1001-5000' AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk)
 LIMIT 100