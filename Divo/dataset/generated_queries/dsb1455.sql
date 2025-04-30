--dsb_templates_generated-87f5dfba-ef93-4967-ad50-6e909904ebe9_15604886-3220-3f37-9dc7-5ee7c8d49378.sql
--{"gen": "combine", "time": 0.25812530517578125, "template": "generated-87f5dfba-ef93-4967-ad50-6e909904ebe9", "dataset": "dsb_templates", "rows": 12}
SELECT store.s_city,
store.s_company_id,
store.s_county,
store.s_state,
store.s_store_name,
store.s_street_name,
store.s_street_number,
store.s_street_type,
store.s_suite_number,
store.s_zip,
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d2,
store AS store,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band
WHERE (d2.d_year = 2002 AND d2.d_moy = 9 AND income_band.ib_lower_bound >= 7418 AND income_band.ib_upper_bound <= 18824 + 50000 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_store_sk = store.s_store_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 group by store.s_city, store.s_company_id, store.s_county, store.s_state, store.s_store_name, store.s_street_name, store.s_street_number, store.s_street_type, store.s_suite_number, store.s_zip order by store.s_store_name, store.s_company_id, store.s_street_number, store.s_street_name, store.s_street_type, store.s_suite_number, store.s_city, store.s_county, store.s_state, store.s_zip LIMIT 100