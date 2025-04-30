--dsb_templates_generated-1ab1d3ea-37da-4fa2-9c40-a09f61fc9042_03ac2602-192b-31f9-8fa8-73b3c120ee72.sql
--{"gen": "erase", "time": 0.9487977027893066, "template": "generated-1ab1d3ea-37da-4fa2-9c40-a09f61fc9042", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM catalog_sales AS catalog_sales,
customer AS customer,
store AS store,
store_returns AS store_returns,
store_sales AS store_sales,
household_demographics AS household_demographics,
income_band AS income_band
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 51 AND 56 AND customer.c_birth_month = 1 AND income_band.ib_lower_bound >= 7805 AND income_band.ib_upper_bound <= 63592 + 50000 AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk)
 LIMIT 100