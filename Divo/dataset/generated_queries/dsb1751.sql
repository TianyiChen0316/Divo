--dsb_templates_query102_042_310e307c-33b8-3e83-a9f7-1d7cf073874c.sql
--{"gen": "erase", "time": 4.418954610824585, "template": "query102_042", "dataset": "dsb_templates", "rows": 310}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status,
household_demographics.hd_vehicle_count
FROM customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS d2,
household_demographics AS household_demographics,
inventory AS inventory,
item AS item,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (item.i_category IN ('Electronics', 'Jewelry', 'Women') AND item.i_manager_id IN (3, 7, 8, 19, 28, 32, 42, 53, 55, 92) AND web_sales.ws_wholesale_cost BETWEEN 22 AND 42 AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = inventory.inv_item_sk AND web_sales.ws_item_sk = inventory.inv_item_sk)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status, household_demographics.hd_vehicle_count order by cnt