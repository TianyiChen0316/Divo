--dsb_templates_generated-04b24f5e-5c0e-407a-a0ca-e884cc215331_41e21fce-3ab8-3a65-a4d6-39e19f188344.sql
--{"gen": "combine", "time": 1.1787135601043701, "template": "generated-04b24f5e-5c0e-407a-a0ca-e884cc215331", "dataset": "dsb_templates", "rows": 1}
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
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
call_center AS call_center,
warehouse AS warehouse
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 52 AND 57 AND customer.c_birth_month = 1 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND customer_demographics.cd_education_status = 'Primary' AND customer_demographics.cd_gender = 'M' AND date_dim.d_year = 1998 AND item.i_category = 'Children' AND store.s_state = 'SD' AND call_center.cc_class = 'large' AND warehouse.w_gmt_offset = -5 AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_cdemo_sk = store_sales.ss_cdemo_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND d1.d_date_sk = catalog_sales.cs_sold_date_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk)
 group by rollup(item.i_item_id, customer_address.ca_country, customer_address.ca_state, customer_address.ca_county) order by customer_address.ca_country, customer_address.ca_state, customer_address.ca_county, item.i_item_id LIMIT 100