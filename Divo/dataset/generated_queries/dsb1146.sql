--dsb_templates_generated-6515cac2-2329-419e-a676-0d35dc098059_21cc936c-3232-341d-b139-3eec95c6f9f3.sql
--{"gen": "combine", "time": 1.643066167831421, "template": "generated-6515cac2-2329-419e-a676-0d35dc098059", "dataset": "dsb_templates", "rows": 3}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
store_returns AS store_returns,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'White Oak' AND date_dim.d_moy = 2 AND date_dim.d_year = 2000 AND item.i_category = 'Music' AND store_sales.ss_wholesale_cost BETWEEN 52 AND 72 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by customer.c_customer_id LIMIT 100