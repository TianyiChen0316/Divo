--dsb_templates_generated-87d7d4f6-3543-44c4-b563-16d6845e6b19_2751cca3-e930-34af-86ba-fcf9b10d012f.sql
--{"gen": "erase", "time": 4.963414430618286, "template": "generated-87d7d4f6-3543-44c4-b563-16d6845e6b19", "dataset": "dsb_templates", "rows": 310}
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
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (item.i_category IN ('Electronics', 'Jewelry', 'Women') AND item.i_manager_id IN (3, 7, 8, 19, 28, 32, 42, 53, 55, 92) AND web_sales.ws_wholesale_cost BETWEEN 76 AND 96 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = inventory.inv_item_sk AND web_sales.ws_item_sk = inventory.inv_item_sk)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status, household_demographics.hd_vehicle_count order by cnt