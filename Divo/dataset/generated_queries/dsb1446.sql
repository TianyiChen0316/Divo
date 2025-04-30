--dsb_templates_generated-0c943db1-271e-4331-bce7-d8125d5db0e5_49bf9755-c277-3401-874d-2a9417598a94.sql
--{"gen": "erase", "time": 0.26352429389953613, "template": "generated-0c943db1-271e-4331-bce7-d8125d5db0e5", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns,
customer AS customer
WHERE (d2.d_moy = 8 AND d2.d_year = 2002 AND customer.c_birth_month = 5 AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100