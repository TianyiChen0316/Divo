--dsb_templates_generated-8dde24d6-dcbb-4e50-8b3d-f5ab63789979_73a616c7-9b4f-3bd1-96b8-9dea74976675.sql
--{"gen": "erase", "time": 1.642998456954956, "template": "generated-8dde24d6-dcbb-4e50-8b3d-f5ab63789979", "dataset": "dsb_templates", "rows": 14150}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt