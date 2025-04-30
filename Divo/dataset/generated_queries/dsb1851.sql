--dsb_templates_generated-4b3a9055-b4cc-4690-aae2-b5fddbc7da97_6692cb40-d29a-37f5-8a8f-e1e1d9c3b250.sql
--{"gen": "combine", "time": 1.574415922164917, "template": "generated-4b3a9055-b4cc-4690-aae2-b5fddbc7da97", "dataset": "dsb_templates", "rows": 16}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
store_returns AS store_returns,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Newtown' AND date_dim.d_moy = 3 AND date_dim.d_year = 2002 AND item.i_category = 'Electronics' AND store_sales.ss_wholesale_cost BETWEEN 77 AND 97 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by customer.c_customer_id LIMIT 100