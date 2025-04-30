--dsb_templates_generated-c15a3297-2ca1-43c2-83c1-d65ad9502be6_29053292-abff-3c32-848b-0885a1430b3e.sql
--{"gen": "combine", "time": 0.6228199005126953, "template": "generated-c15a3297-2ca1-43c2-83c1-d65ad9502be6", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state,
item.i_item_id
FROM catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns,
date_dim AS d2,
store AS store,
store_sales AS store_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 25 AND 30 AND customer.c_birth_month = 3 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'F' AND date_dim.d_year = 2002 AND item.i_category = 'Sports' AND income_band.ib_lower_bound >= 36341 AND income_band.ib_upper_bound <= 4038 + 50000 AND d2.d_moy BETWEEN 8 AND 8 + 2 AND d2.d_year = 2000 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND item.i_item_sk = store_sales.ss_item_sk AND store.s_store_sk = store_sales.ss_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100