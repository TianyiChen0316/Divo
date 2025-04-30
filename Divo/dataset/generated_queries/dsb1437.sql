--dsb_templates_query027_036_62f81b84-e1ca-3d8d-9e98-eec5a697dd06.sql
--{"gen": "combine", "time": 0.26343584060668945, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
household_demographics AS household_demographics,
income_band AS income_band
WHERE (date_dim.d_year = 2000 AND item.i_category = 'Music' AND store.s_state = 'GA' AND d2.d_moy = 2 AND d2.d_year = 1998 AND income_band.ib_lower_bound >= 28036 AND income_band.ib_upper_bound <= 43657 + 50000 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_returns.sr_cdemo_sk = store_sales.ss_cdemo_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100