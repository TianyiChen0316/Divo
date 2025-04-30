--dsb_templates_generated-b51b358b-ba66-4a21-a227-e0e63d4b72da_e1cdefeb-cab3-38b3-81ca-a9a72dfb70e7.sql
--{"gen": "combine", "time": 0.6607043743133545, "template": "generated-b51b358b-ba66-4a21-a227-e0e63d4b72da", "dataset": "dsb_templates", "rows": 1}
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
household_demographics AS household_demographics,
income_band AS income_band
WHERE (customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'D' AND date_dim.d_year = 2000 AND item.i_category = 'Home' AND store.s_state = 'TN' AND d2.d_moy = 1 AND d2.d_year = 2002 AND d3.d_moy BETWEEN 6 AND 6 + 2 AND d3.d_year = 1998 AND income_band.ib_lower_bound >= 60864 AND income_band.ib_upper_bound <= 13498 + 50000 AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100