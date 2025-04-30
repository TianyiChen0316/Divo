--dsb_templates_generated-9bb49c15-084e-4cfc-94b8-42b67aeee135_55ca5fea-9a52-3426-b73e-02d62de282c8.sql
--{"gen": "erase", "time": 0.8925392627716064, "template": "generated-9bb49c15-084e-4cfc-94b8-42b67aeee135", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM web_sales AS web_sales,
item AS item,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns
WHERE (web_sales.ws_wholesale_cost BETWEEN 12 AND 32 AND item.i_category = 'Electronics' AND d2.d_moy = 9 AND d2.d_year = 2001 AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND web_sales.ws_bill_customer_sk = store_sales.ss_customer_sk)
 order by cnt