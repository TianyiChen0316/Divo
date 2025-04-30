--dsb_templates_generated-20d423f1-d43c-43c7-832d-ebf0de856a22_fcdfe1d7-8220-37dd-bd00-5a11942d7a53.sql
--{"gen": "erase", "time": 0.8509616851806641, "template": "generated-20d423f1-d43c-43c7-832d-ebf0de856a22", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM web_sales AS web_sales,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns
WHERE (web_sales.ws_wholesale_cost BETWEEN 28 AND 48 AND d2.d_moy = 11 AND d2.d_year = 2001 AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND web_sales.ws_bill_customer_sk = store_sales.ss_customer_sk)
 order by cnt