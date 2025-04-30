--dsb_templates_generated-45c29bd7-fc35-4ae1-a186-2ce0a859f5ad_ba97a7ab-8fa2-31d5-b78b-da4cdbdd31db.sql
--{"gen": "combine", "time": 0.45314455032348633, "template": "generated-45c29bd7-fc35-4ae1-a186-2ce0a859f5ad", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
date_dim AS d3,
customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
web_sales AS web_sales
WHERE (customer_demographics.cd_education_status = '4 yr Degree' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'D' AND date_dim.d_year = 1998 AND item.i_category = 'Shoes' AND store.s_state = 'AR' AND d2.d_moy = 6 AND d2.d_year = 2001 AND d3.d_moy BETWEEN 8 AND 8 + 2 AND d3.d_year = 2002 AND customer.c_birth_month = 9 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND household_demographics.hd_buy_potential = '0-500' AND household_demographics.hd_income_band_sk BETWEEN 5 AND 11 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_item_sk = item.i_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND store_returns.sr_returned_date_sk = web_sales.ws_sold_date_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100