--dsb_templates_query050_013_1de012a9-710c-3a05-8555-e040d46c65e1.sql
--{"gen": "combine", "time": 0.4691774845123291, "template": "query050_013", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
customer AS customer,
date_dim AS date_dim,
web_sales AS web_sales,
date_dim AS d3
WHERE (d2.d_moy = 4 AND d2.d_year = 1998 AND catalog_sales.cs_wholesale_cost BETWEEN 10 AND 15 AND customer.c_birth_month = 10 AND date_dim.d_year = 2001 AND d3.d_moy BETWEEN 3 AND 3 + 2 AND d3.d_year = 1999 AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND date_dim.d_date_sk = d3.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND d3.d_date_sk = d1.d_date_sk AND d3.d_date_sk = store_sales.ss_sold_date_sk AND d1.d_date_sk = catalog_sales.cs_sold_date_sk AND store_sales.ss_sold_date_sk = catalog_sales.cs_sold_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND store_returns.sr_customer_sk = customer.c_customer_sk AND store_returns.sr_returned_date_sk = web_sales.ws_sold_date_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 LIMIT 100