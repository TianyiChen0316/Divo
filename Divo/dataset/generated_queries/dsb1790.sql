--dsb_templates_generated-1cbd1f9a-986b-4a4e-8b30-1c4c00ddda2e_775b12b0-420f-3cee-8105-db2ef23a1904.sql
--{"gen": "combine", "time": 4.336731910705566, "template": "generated-1cbd1f9a-986b-4a4e-8b30-1c4c00ddda2e", "dataset": "dsb_templates", "rows": 310}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status,
household_demographics.hd_vehicle_count
FROM customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
inventory AS inventory,
item AS item,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (item.i_category IN ('Electronics', 'Jewelry', 'Women') AND item.i_manager_id IN (3, 7, 8, 19, 28, 32, 42, 53, 55, 92) AND web_sales.ws_wholesale_cost BETWEEN 18 AND 38 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = inventory.inv_item_sk AND web_sales.ws_item_sk = inventory.inv_item_sk)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status, household_demographics.hd_vehicle_count order by cnt