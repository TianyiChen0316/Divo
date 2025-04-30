--dsb_templates_generated-78482f79-dba2-49aa-865f-280df62a6b44_eb71c835-ebc9-3db6-ab38-b43d2c01f549.sql
--{"gen": "erase", "time": 1.4898579120635986, "template": "generated-78482f79-dba2-49aa-865f-280df62a6b44", "dataset": "dsb_templates", "rows": 32}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
date_dim AS d1,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND d1.d_year = 1998 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt