--dsb_templates_generated-eac556fc-733b-40c1-8779-828b960c3c0a_0691ea02-42e5-3bb4-ac2b-d47340df4664.sql
--{"gen": "combine", "time": 3.2600483894348145, "template": "generated-eac556fc-733b-40c1-8779-828b960c3c0a", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
date_dim AS d3,
customer AS customer,
store_sales AS s1,
store_sales AS s2,
customer_address AS customer_address,
item AS item,
web_sales AS web_sales,
store AS store,
household_demographics AS household_demographics
WHERE (date_dim.d_year = 1998 AND d3.d_moy BETWEEN 10 AND 10 + 2 AND d3.d_year = 1998 AND customer.c_birth_month = 8 AND s1.ss_list_price BETWEEN 81 AND 95 AND s2.ss_list_price BETWEEN 23 AND 37 AND customer_address.ca_state = 'OR' AND item.i_category = 'Music' AND household_demographics.hd_income_band_sk BETWEEN 14 AND 20 AND household_demographics.hd_buy_potential = '0-500' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND s1.ss_customer_sk = store_returns.sr_customer_sk AND s1.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND store.s_store_sk = store_sales.ss_store_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND web_sales.ws_item_sk = item.i_item_sk AND s1.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk)
 LIMIT 100