--dsb_templates_generated-1e3924bc-1515-44d5-b2ba-14fc32d0e2b3_c435b503-a345-377f-a8cd-1f197a445248.sql
--{"gen": "combine", "time": 0.9384114742279053, "template": "generated-1e3924bc-1515-44d5-b2ba-14fc32d0e2b3", "dataset": "dsb_templates", "rows": 1}
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
customer_demographics AS customer_demographics
WHERE (date_dim.d_year = 2002 AND store.s_state = 'MS' AND item.i_category = 'Women' AND catalog_sales.cs_wholesale_cost BETWEEN 23 AND 28 AND customer.c_birth_month = 8 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_gender = 'F' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100