--dsb_templates_generated-0c943db1-271e-4331-bce7-d8125d5db0e5_1c949a76-0cb8-3183-9f8e-e4897d5c87ec.sql
--{"gen": "erase", "time": 0.3832359313964844, "template": "generated-0c943db1-271e-4331-bce7-d8125d5db0e5", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM store_sales AS store_sales,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address
WHERE (customer.c_birth_month = 11 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100