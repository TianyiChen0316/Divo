--dsb_templates_generated-7e1d666f-9261-4ba6-b6c2-5748cb4dedd4_80bd7377-cc0d-3222-acee-4dc34b8ea6ce.sql
--{"gen": "erase", "time": 2.300908088684082, "template": "generated-7e1d666f-9261-4ba6-b6c2-5748cb4dedd4", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
store_sales AS s1,
household_demographics AS household_demographics,
income_band AS income_band,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales
WHERE (s1.ss_list_price BETWEEN 4 AND 18 AND income_band.ib_lower_bound >= 46057 AND income_band.ib_upper_bound <= 20628 + 50000 AND date_dim.d_moy = 10 AND date_dim.d_year = 2000 AND store_sales.ss_wholesale_cost BETWEEN 62 AND 82 AND s1.ss_customer_sk = customer.c_customer_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk)
 order by cnt