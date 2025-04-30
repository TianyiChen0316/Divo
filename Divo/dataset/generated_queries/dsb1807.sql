--dsb_templates_generated-f480771b-ad8a-43c3-87a9-750dacd8980e_52eb8688-29e4-3c20-a9f2-39edfa731242.sql
--{"gen": "combine", "time": 2.4361188411712646, "template": "generated-f480771b-ad8a-43c3-87a9-750dacd8980e", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
store_sales AS s1,
store_sales AS s2,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (date_dim.d_year = 2002 AND item.i_category = 'Home' AND store.s_state = 'MN' AND customer.c_birth_month = 9 AND customer_address.ca_state = 'KY' AND s1.ss_list_price BETWEEN 19 AND 33 AND s2.ss_list_price BETWEEN 268 AND 282 AND income_band.ib_lower_bound >= 52251 AND income_band.ib_upper_bound <= 56635 + 50000 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_returns.sr_cdemo_sk = store_sales.ss_cdemo_sk AND s1.ss_customer_sk = store_sales.ss_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100