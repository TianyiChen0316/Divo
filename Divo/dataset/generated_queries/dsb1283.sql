--dsb_templates_generated-8dde24d6-dcbb-4e50-8b3d-f5ab63789979_1d7ad780-966f-389a-9fb2-8ac67e25a9cd.sql
--{"gen": "combine", "time": 2.585940361022949, "template": "generated-8dde24d6-dcbb-4e50-8b3d-f5ab63789979", "dataset": "dsb_templates", "rows": 26}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d2,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales,
date_dim AS date_dim,
date_dim AS d1,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND date_dim.d_year = 1998 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 242 AND 256 AND s2.ss_list_price BETWEEN 261 AND 275 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND d1.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = web_sales.ws_bill_customer_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt