--dsb_templates_generated-20f729c2-cdd0-4488-b519-04e7e6965e59_80299e85-de13-352c-89d6-e72258f890a7.sql
--{"gen": "erase", "time": 2.485635995864868, "template": "generated-20f729c2-cdd0-4488-b519-04e7e6965e59", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns
WHERE (customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'S' AND date_dim.d_year = 1998 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk)
 LIMIT 100