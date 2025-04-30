--dsb_templates_query018_076_ab34f01a-cb2c-3cd0-a49d-fc8ddd098727.sql
--{"gen": "combine", "time": 2.848357677459717, "template": "query018_076", "dataset": "dsb_templates", "rows": 1}
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
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 6 AND 11 AND customer.c_birth_month = 6 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = 'Secondary' AND customer_demographics.cd_gender = 'F' AND date_dim.d_year = 2001 AND item.i_category = 'Children' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 40 AND 59 AND s1.ss_list_price BETWEEN 180 AND 194 AND s2.ss_list_price BETWEEN 258 AND 272 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND catalog_sales.cs_bill_customer_sk = s1.ss_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100