--dsb_templates_generated-0a0c8c12-a446-4e03-9804-fbf3c0de939b_fbb72f01-9f66-347c-abab-94e16217a22a.sql
--{"gen": "erase", "time": 0.3313422203063965, "template": "generated-0a0c8c12-a446-4e03-9804-fbf3c0de939b", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
item.i_item_id
FROM catalog_sales AS catalog_sales,
customer AS customer,
date_dim AS date_dim,
item AS item,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 49 AND 54 AND customer.c_birth_month = 4 AND date_dim.d_year = 2001 AND item.i_category = 'Sports' AND income_band.ib_lower_bound >= 7805 AND income_band.ib_upper_bound <= 69169 + 50000 AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100