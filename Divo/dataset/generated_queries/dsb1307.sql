--dsb_templates_generated-5cc9db60-6f00-4752-95f9-5ad868259813_b09ab759-8fa3-3fe8-8851-be8afb0fcb6b.sql
--{"gen": "combine", "time": 3.6216156482696533, "template": "generated-5cc9db60-6f00-4752-95f9-5ad868259813", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store AS store,
store_sales AS store_sales,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (income_band.ib_lower_bound >= 2617 AND income_band.ib_upper_bound <= 63592 + 50000 AND web_sales.ws_wholesale_cost BETWEEN 18 AND 38 AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk)
 order by customer.c_customer_id LIMIT 100