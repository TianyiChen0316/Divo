--dsb_templates_generated-25f9705c-7953-4dc7-a955-05b98883860a_0c38e08c-0262-34b9-84bc-c3cdb2c7c37f.sql
--{"gen": "erase", "time": 1.6571712493896484, "template": "generated-25f9705c-7953-4dc7-a955-05b98883860a", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
store_returns AS store_returns,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Glendale' AND item.i_category = 'Children' AND store_sales.ss_wholesale_cost BETWEEN 43 AND 63 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by customer.c_customer_id LIMIT 100