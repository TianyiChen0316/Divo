--dsb_templates_query102_042_6d3d2d88-74ab-3efd-9e3f-ca3c5398d18f.sql
--{"gen": "erase", "time": 3.898482322692871, "template": "query102_042", "dataset": "dsb_templates", "rows": 48}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status,
household_demographics.hd_vehicle_count
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS d1,
date_dim AS d2,
household_demographics AS household_demographics,
inventory AS inventory,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 2001 AND web_sales.ws_wholesale_cost BETWEEN 69 AND 89 AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status, household_demographics.hd_vehicle_count order by cnt