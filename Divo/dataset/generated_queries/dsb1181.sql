--dsb_templates_generated-c15a3297-2ca1-43c2-83c1-d65ad9502be6_edd4555b-579c-3f21-9e43-1f24465f93d0.sql
--{"gen": "erase", "time": 0.9310929775238037, "template": "generated-c15a3297-2ca1-43c2-83c1-d65ad9502be6", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
item.i_item_id
FROM catalog_sales AS catalog_sales,
customer AS customer,
item AS item,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 61 AND 66 AND customer.c_birth_month = 12 AND item.i_category = 'Home' AND income_band.ib_lower_bound >= 27339 AND income_band.ib_upper_bound <= 4031 + 50000 AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100