--dsb_templates_generated-7fd4d0e3-0081-4be1-8564-ca744e3c3f62_e0d031b7-5f73-3c89-8d3a-de5b85a8d7b1.sql
--{"gen": "erase", "time": 4.274392604827881, "template": "generated-7fd4d0e3-0081-4be1-8564-ca744e3c3f62", "dataset": "dsb_templates", "rows": 4214}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
date_dim AS d2,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales,
date_dim AS date_dim,
item AS item1,
store_sales AS s1
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND date_dim.d_year = 1999 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 81 AND 95 AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = web_sales.ws_bill_customer_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt