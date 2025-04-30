--dsb_templates_query050_013_62f81b84-e1ca-3d8d-9e98-eec5a697dd06.sql
--{"gen": "combine", "time": 0.2932295799255371, "template": "query050_013", "dataset": "dsb_templates", "rows": 5}
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
FROM date_dim AS d1,
date_dim AS d2,
store AS store,
store_returns AS store_returns,
store_sales AS store_sales,
customer_demographics AS customer_demographics,
item AS item
WHERE (d2.d_moy = 10 AND d2.d_year = 1999 AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'M' AND customer_demographics.cd_education_status = 'College' AND item.i_category = 'Women' AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_item_sk = item.i_item_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by store.s_city, store.s_company_id, store.s_county, store.s_state, store.s_store_name, store.s_street_name, store.s_street_number, store.s_street_type, store.s_suite_number, store.s_zip order by store.s_store_name, store.s_company_id, store.s_street_number, store.s_street_name, store.s_street_type, store.s_suite_number, store.s_city, store.s_county, store.s_state, store.s_zip LIMIT 100