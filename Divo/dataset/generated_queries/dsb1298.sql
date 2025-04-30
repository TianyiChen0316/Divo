--dsb_templates_query018_076_4a1611c5-e02b-3daa-b651-64f427300684.sql
--{"gen": "combine", "time": 0.6527745723724365, "template": "query018_076", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d1,
date_dim AS d2,
date_dim AS d3,
store AS store,
store_returns AS store_returns,
store_sales AS store_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 61 AND 66 AND customer.c_birth_month = 7 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_gender = 'F' AND date_dim.d_year = 2001 AND item.i_category = 'Shoes' AND d1.d_moy = 10 AND d1.d_year = 2000 AND d2.d_moy BETWEEN 9 AND 9 + 2 AND d2.d_year = 2002 AND d3.d_moy BETWEEN 5 AND 5 + 2 AND d3.d_year = 2001 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND d1.d_date_sk = store_sales.ss_sold_date_sk AND item.i_item_sk = store_sales.ss_item_sk AND store.s_store_sk = store_sales.ss_store_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d3.d_date_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100