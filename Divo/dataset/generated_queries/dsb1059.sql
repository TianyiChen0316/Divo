--dsb_templates_query101_069_b9c9e799-f11b-3641-99ba-e3c3f3dfc21b.sql
--{"gen": "erase", "time": 4.118624687194824, "template": "query101_069", "dataset": "dsb_templates", "rows": 828}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND household_demographics.hd_income_band_sk BETWEEN 0 AND 6 AND household_demographics.hd_buy_potential = 'Unknown' AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND item.i_item_sk = store_sales.ss_item_sk AND item.i_item_sk = store_returns.sr_item_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt