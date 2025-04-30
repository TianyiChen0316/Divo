--dsb_templates_generated-a5a8ce47-7696-47ea-9919-6fe6bc152434_d2967aef-9499-30a5-a66d-7d753c578821.sql
--{"gen": "erase", "time": 0.4207613468170166, "template": "generated-a5a8ce47-7696-47ea-9919-6fe6bc152434", "dataset": "dsb_templates", "rows": 1}
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
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
household_demographics AS household_demographics,
item AS item
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 33 AND 38 AND customer.c_birth_month = 2 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND item.i_category IN ('Books', 'Electronics', 'Sports') AND household_demographics.hd_income_band_sk BETWEEN 6 AND 12 AND household_demographics.hd_buy_potential = '1001-5000' AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND item.i_item_sk = store_sales.ss_item_sk)
 group by rollup(customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county LIMIT 100