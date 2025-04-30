--dsb_templates_generated-c15a3297-2ca1-43c2-83c1-d65ad9502be6_40adf5e9-2385-3d2c-a13f-bdedd1f44428.sql
--{"gen": "erase", "time": 0.9522035121917725, "template": "generated-c15a3297-2ca1-43c2-83c1-d65ad9502be6", "dataset": "dsb_templates", "rows": 1}
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
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 37 AND 42 AND customer.c_birth_month = 6 AND item.i_category = 'Sports' AND income_band.ib_lower_bound >= 46057 AND income_band.ib_upper_bound <= 32361 + 50000 AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100