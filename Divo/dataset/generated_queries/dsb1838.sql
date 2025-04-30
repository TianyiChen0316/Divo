--dsb_templates_generated-5192e4d5-79f2-4018-8803-132dae96aae7_baf41f30-d425-3fa2-95d5-84810105a973.sql
--{"gen": "combine", "time": 0.317507266998291, "template": "generated-5192e4d5-79f2-4018-8803-132dae96aae7", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store
WHERE (d2.d_year = 2000 AND d2.d_moy = 12 AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'M' AND date_dim.d_year = 2000 AND item.i_category = 'Jewelry' AND store.s_state = 'TX' AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 LIMIT 100