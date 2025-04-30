--dsb_templates_query018_076_2564f8af-dcac-3f7f-9960-aa5610851790.sql
--{"gen": "erase", "time": 1.0586845874786377, "template": "query018_076", "dataset": "dsb_templates", "rows": 100}
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
WHERE (date_dim.d_year = 1999 AND customer.c_birth_month = 1 AND catalog_sales.cs_wholesale_cost BETWEEN 21 AND 26 AND item.i_category = 'Children' AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100