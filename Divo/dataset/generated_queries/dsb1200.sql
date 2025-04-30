--dsb_templates_generated-c37b821d-df09-4eb0-98ef-90f2006fa43c_ea0e21c4-2bbe-380e-a21d-9ece7ff5354b.sql
--{"gen": "erase", "time": 1.0227797031402588, "template": "generated-c37b821d-df09-4eb0-98ef-90f2006fa43c", "dataset": "dsb_templates", "rows": 20}
SELECT *
FROM date_dim AS d1,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
income_band AS income_band,
date_dim AS date_dim
WHERE (customer_address.ca_city = 'Franklin' AND income_band.ib_lower_bound >= 27632 AND income_band.ib_upper_bound <= 27360 + 50000 AND date_dim.d_moy = 2 AND date_dim.d_year = 2002 AND store_sales.ss_sold_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND date_dim.d_date_sk = d1.d_date_sk)
 LIMIT 100