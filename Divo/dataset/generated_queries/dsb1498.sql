--dsb_templates_query018_076_f3562182-503f-3a53-a725-2f3be07b051e.sql
--{"gen": "combine", "time": 0.7026774883270264, "template": "query018_076", "dataset": "dsb_templates", "rows": 1}
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
item AS item,
household_demographics AS household_demographics,
inventory AS inventory,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 49 AND 54 AND customer.c_birth_month = 12 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND date_dim.d_year = 2002 AND item.i_category = 'Books' AND web_sales.ws_wholesale_cost BETWEEN 74 AND 94 AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = inventory.inv_item_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND inventory.inv_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100