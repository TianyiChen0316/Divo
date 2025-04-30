--dsb_templates_generated-3079105c-014c-4221-995b-38782dfd646b_d4390e32-f06b-38b7-898f-c57944c964b2.sql
--{"gen": "combine", "time": 0.6612920761108398, "template": "generated-3079105c-014c-4221-995b-38782dfd646b", "dataset": "dsb_templates", "rows": 1}
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
catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS d2,
household_demographics AS household_demographics,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (date_dim.d_year = 1999 AND store.s_state = 'KY' AND item.i_category = 'Books' AND catalog_sales.cs_wholesale_cost BETWEEN 68 AND 73 AND customer.c_birth_month = 2 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'M' AND household_demographics.hd_income_band_sk BETWEEN 4 AND 10 AND household_demographics.hd_buy_potential = 'Unknown' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = store_sales.ss_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100