--dsb_templates_generated-0fc8a97b-34c7-4131-814a-2264099a9d64_4c742aed-b8bf-3a78-b400-1ab0793d0b14.sql
--{"gen": "erase", "time": 1.6530227661132812, "template": "generated-0fc8a97b-34c7-4131-814a-2264099a9d64", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
household_demographics AS household_demographics,
store_sales AS s1,
customer_address AS customer_address,
customer_demographics AS customer_demographics
WHERE (s1.ss_list_price BETWEEN 117 AND 131 AND customer_address.ca_city = 'Bethel' AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk)
 LIMIT 100