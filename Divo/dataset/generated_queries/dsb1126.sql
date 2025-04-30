--dsb_templates_query018_076_5bbe1a66-62ff-3b4d-a547-b215e4b8055b.sql
--{"gen": "erase", "time": 0.9863121509552002, "template": "query018_076", "dataset": "dsb_templates", "rows": 36}
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
date_dim AS date_dim,
item AS item
WHERE (date_dim.d_year = 1999 AND customer.c_birth_month = 9 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND catalog_sales.cs_wholesale_cost BETWEEN 53 AND 58 AND item.i_category = 'Books' AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100