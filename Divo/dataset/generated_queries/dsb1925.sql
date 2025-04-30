--dsb_templates_generated-aa091594-f851-451a-a05e-10f212b297ae_55c6d24a-9660-3992-9a18-b885ad7bb3e3.sql
--{"gen": "erase", "time": 0.40227723121643066, "template": "generated-aa091594-f851-451a-a05e-10f212b297ae", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state
FROM customer AS customer,
customer_address AS customer_address,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
household_demographics AS household_demographics,
item AS item
WHERE (customer.c_birth_month = 5 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND item.i_category IN ('Books', 'Electronics', 'Sports') AND household_demographics.hd_income_band_sk BETWEEN 9 AND 15 AND household_demographics.hd_buy_potential = '5001-10000' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = store_sales.ss_item_sk)
 group by rollup(customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county LIMIT 100