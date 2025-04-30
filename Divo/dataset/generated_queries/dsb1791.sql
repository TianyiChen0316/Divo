--dsb_templates_generated-6556f54b-e46f-4f20-a878-6519b0493a3c_8ab589bb-c6f8-3a07-bfc6-49f75813d971.sql
--{"gen": "erase", "time": 0.34997010231018066, "template": "generated-6556f54b-e46f-4f20-a878-6519b0493a3c", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
customer_demographics AS customer_demographics,
item AS item,
household_demographics AS household_demographics,
income_band AS income_band
WHERE (customer.c_birth_month = 11 AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'F' AND item.i_category = 'Children' AND income_band.ib_lower_bound >= 46057 AND income_band.ib_upper_bound <= 23766 + 50000 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100