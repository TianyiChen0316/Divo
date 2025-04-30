--dsb_templates_generated-724f5ec2-63d5-4243-b847-0cccff4cf9c0_0c38e08c-0262-34b9-84bc-c3cdb2c7c37f.sql
--{"gen": "combine", "time": 0.2778143882751465, "template": "generated-724f5ec2-63d5-4243-b847-0cccff4cf9c0", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
household_demographics AS household_demographics,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales,
customer_demographics AS customer_demographics,
item AS item,
store AS store,
store_returns AS store_returns
WHERE (date_dim.d_year = 2001 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 2000 AND web_sales.ws_wholesale_cost BETWEEN 17 AND 37 AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'M' AND item.i_category = 'Children' AND store.s_state = 'SC' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk)
 LIMIT 100