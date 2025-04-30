--dsb_templates_query027_036_3f059123-93cd-34fd-ab51-e57cfb772351.sql
--{"gen": "combine", "time": 3.2556135654449463, "template": "query027_036", "dataset": "dsb_templates", "rows": 91}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM date_dim AS date_dim,
item AS item,
store_sales AS store_sales,
customer AS customer,
item AS item1,
store_sales AS s1,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (date_dim.d_year = 2002 AND item.i_category = 'Women' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 196 AND 210 AND income_band.ib_lower_bound >= 10939 AND income_band.ib_upper_bound <= 19813 + 50000 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_returns.sr_cdemo_sk = store_sales.ss_cdemo_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100