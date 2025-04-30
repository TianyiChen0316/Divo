--dsb_templates_generated-48f6a21b-fa18-45a3-a3cb-603df4f3b3ed_cbd2ecd4-4046-3ad4-a095-a6e70c309e6b.sql
--{"gen": "erase", "time": 0.8473410606384277, "template": "generated-48f6a21b-fa18-45a3-a3cb-603df4f3b3ed", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS date_dim,
date_dim AS d2,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 23 AND 28 AND customer.c_birth_month = 2 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND date_dim.d_year = 1999 AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk)
 group by rollup(customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county LIMIT 100