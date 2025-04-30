--dsb_templates_generated-aba8dd51-2676-41e4-b582-d464253e8aec_fa5870dd-a778-36ee-9117-6e0293957f30.sql
--{"gen": "erase", "time": 4.284589052200317, "template": "generated-aba8dd51-2676-41e4-b582-d464253e8aec", "dataset": "dsb_templates", "rows": 13781}
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
date_dim AS d1
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND d1.d_year = 1998 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt