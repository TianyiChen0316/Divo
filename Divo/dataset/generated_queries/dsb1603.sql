--dsb_templates_generated-bf71196e-4f18-43f5-bde1-0ee842901608_7cb1608a-560a-3a28-9c94-3f9d37002305.sql
--{"gen": "combine", "time": 1.7448737621307373, "template": "generated-bf71196e-4f18-43f5-bde1-0ee842901608", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
customer_address.ca_country,
customer_address.ca_county,
customer_address.ca_state
FROM catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
household_demographics AS household_demographics,
item AS item,
store AS store
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 30 AND 35 AND customer.c_birth_month = 2 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'M' AND date_dim.d_year = 1999 AND d1.d_year = 1998 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND item.i_category IN ('Books', 'Electronics', 'Sports') AND household_demographics.hd_income_band_sk BETWEEN 20 AND 26 AND household_demographics.hd_buy_potential = '5001-10000' AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 group by rollup(customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county LIMIT 100