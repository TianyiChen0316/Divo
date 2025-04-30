--dsb_templates_query019_088_a3b3fe8e-6078-3aea-98bd-5f369aa30ca3.sql
--{"gen": "combine", "time": 1.6521291732788086, "template": "query019_088", "dataset": "dsb_templates", "rows": 2}
SELECT item.i_brand AS brand,
item.i_brand_id AS brand_id,
item.i_manufact,
item.i_manufact_id,
sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (customer.c_birth_month = 7 AND customer_address.ca_state = 'NE' AND date_dim.d_moy = 11 AND date_dim.d_year = 2001 AND item.i_category = 'Shoes' AND store_sales.ss_wholesale_cost BETWEEN 29 AND 49 AND income_band.ib_lower_bound >= 2617 AND income_band.ib_upper_bound <= 52251 + 50000 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100