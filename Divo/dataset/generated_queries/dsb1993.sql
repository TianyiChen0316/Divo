--dsb_templates_query102_042_8359d3a9-de05-3f11-b2de-029e715afa2a.sql
--{"gen": "erase", "time": 3.4238905906677246, "template": "query102_042", "dataset": "dsb_templates", "rows": 2}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status,
household_demographics.hd_vehicle_count
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS d1,
household_demographics AS household_demographics,
inventory AS inventory,
store AS store,
store_sales AS store_sales,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 1998 AND web_sales.ws_wholesale_cost BETWEEN 7 AND 27 AND web_sales.ws_item_sk = store_sales.ss_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_item_sk = store_sales.ss_item_sk AND inventory.inv_date_sk = store_sales.ss_sold_date_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND d1.d_date_sk = inventory.inv_date_sk AND inventory.inv_quantity_on_hand >= store_sales.ss_quantity)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status, household_demographics.hd_vehicle_count order by cnt