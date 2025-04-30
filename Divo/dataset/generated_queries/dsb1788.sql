--dsb_templates_generated-b5955152-1d6d-4d7e-8bb8-edf38c780273_baf41f30-d425-3fa2-95d5-84810105a973.sql
--{"gen": "combine", "time": 1.9222958087921143, "template": "generated-b5955152-1d6d-4d7e-8bb8-edf38c780273", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
customer AS customer,
customer_demographics AS customer_demographics,
item AS item,
household_demographics AS household_demographics,
income_band AS income_band,
date_dim AS date_dim,
store AS store,
date_dim AS d3,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 58 AND 63 AND customer.c_birth_month = 12 AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'F' AND item.i_category = 'Books' AND income_band.ib_lower_bound >= 38417 AND income_band.ib_upper_bound <= 20052 + 50000 AND date_dim.d_year = 1998 AND store.s_state = 'VA' AND d3.d_moy BETWEEN 8 AND 8 + 2 AND d3.d_year = 2000 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 55 AND 74 AND s1.ss_list_price BETWEEN 117 AND 131 AND s2.ss_list_price BETWEEN 212 AND 226 AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND date_dim.d_date_sk = d1.d_date_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = store_returns.sr_customer_sk AND s1.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND s1.ss_customer_sk = store_sales.ss_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 LIMIT 100