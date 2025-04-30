--dsb_templates_generated-d89ab0d3-c544-4508-ab5b-a0ef6b5cd2c5_8b3426c4-1851-3572-ba58-d2bfa85f176f.sql
--{"gen": "combine", "time": 2.123100519180298, "template": "generated-d89ab0d3-c544-4508-ab5b-a0ef6b5cd2c5", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM date_dim AS date_dim,
item AS item,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
customer_demographics AS customer_demographics,
store AS store
WHERE (date_dim.d_year = 2000 AND item.i_category = 'Men' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 22 AND 41 AND s1.ss_list_price BETWEEN 114 AND 128 AND s2.ss_list_price BETWEEN 19 AND 33 AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'W' AND store.s_state = 'FL' AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_store_sk = store.s_store_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100