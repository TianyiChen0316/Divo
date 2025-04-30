--dsb_templates_generated-3079105c-014c-4221-995b-38782dfd646b_d4089ce4-1083-38ea-999a-c8c4a268f845.sql
--{"gen": "combine", "time": 2.708261013031006, "template": "generated-3079105c-014c-4221-995b-38782dfd646b", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year = 1998 AND store.s_state = 'IN' AND item.i_category = 'Electronics' AND catalog_sales.cs_wholesale_cost BETWEEN 71 AND 76 AND customer.c_birth_month = 8 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = 'Primary' AND customer_demographics.cd_gender = 'M' AND s1.ss_list_price BETWEEN 261 AND 275 AND s2.ss_list_price BETWEEN 165 AND 179 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND catalog_sales.cs_bill_customer_sk = s1.ss_customer_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100