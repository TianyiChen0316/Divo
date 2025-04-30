--dsb_templates_generated-25f9705c-7953-4dc7-a955-05b98883860a_7409850a-6726-3cc0-9666-ccb19392637d.sql
--{"gen": "erase", "time": 1.6917006969451904, "template": "generated-25f9705c-7953-4dc7-a955-05b98883860a", "dataset": "dsb_templates", "rows": 4}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Highland' AND income_band.ib_lower_bound >= 27339 AND income_band.ib_upper_bound <= 7418 + 50000 AND item.i_category = 'Electronics' AND store_sales.ss_wholesale_cost BETWEEN 54 AND 74 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by customer.c_customer_id LIMIT 100