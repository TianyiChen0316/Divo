--dsb_templates_generated-87f5dfba-ef93-4967-ad50-6e909904ebe9_2ff90302-4573-3d2a-b598-4f3ab833063f.sql
--{"gen": "combine", "time": 0.3186514377593994, "template": "generated-87f5dfba-ef93-4967-ad50-6e909904ebe9", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM store_returns AS store_returns,
store_sales AS store_sales,
date_dim AS date_dim,
item AS item,
date_dim AS d1,
customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics
WHERE (date_dim.d_year = 1999 AND item.i_category = 'Jewelry' AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND household_demographics.hd_buy_potential = '501-1000' AND household_demographics.hd_income_band_sk BETWEEN 7 AND 13 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk)
 LIMIT 100