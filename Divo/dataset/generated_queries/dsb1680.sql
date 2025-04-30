--dsb_templates_query018_076_715a4c63-0e7c-3a9d-9860-f1aa623ae1e6.sql
--{"gen": "erase", "time": 0.9734501838684082, "template": "query018_076", "dataset": "dsb_templates", "rows": 100}
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
item AS item
WHERE (date_dim.d_year = 1998 AND customer.c_birth_month = 9 AND catalog_sales.cs_wholesale_cost BETWEEN 47 AND 52 AND item.i_category = 'Books' AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100