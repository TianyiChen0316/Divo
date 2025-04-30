--dsb_templates_generated-b44c9bd0-03ef-4243-b1e2-fa50e2a5be5f_c12f126b-405a-3896-a835-b454406ff6a0.sql
--{"gen": "combine", "time": 4.082841396331787, "template": "generated-b44c9bd0-03ef-4243-b1e2-fa50e2a5be5f", "dataset": "dsb_templates", "rows": 6}
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
customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
customer_address AS customer_address,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (d2.d_moy = 2 AND d2.d_year = 2002 AND income_band.ib_lower_bound >= 23628 AND income_band.ib_upper_bound <= 41657 + 50000 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 52 AND 72 AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_item_sk = web_sales.ws_item_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by store.s_city, store.s_company_id, store.s_county, store.s_state, store.s_store_name, store.s_street_name, store.s_street_number, store.s_street_type, store.s_suite_number, store.s_zip order by store.s_store_name, store.s_company_id, store.s_street_number, store.s_street_name, store.s_street_type, store.s_suite_number, store.s_city, store.s_county, store.s_state, store.s_zip LIMIT 100